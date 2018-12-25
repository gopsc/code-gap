VERSION 5.00
Begin VB.Form 声音 
   Caption         =   "AUDIO"
   ClientHeight    =   4500
   ClientLeft      =   1740
   ClientTop       =   2865
   ClientWidth     =   8325
   Icon            =   "声音.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   300
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   555
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   0
      Max             =   24
      Min             =   -24
      TabIndex        =   5
      Top             =   720
      Width           =   8295
   End
   Begin VB.PictureBox BX 
      BackColor       =   &H00000000&
      FillColor       =   &H0000FF00&
      ForeColor       =   &H0000FF00&
      Height          =   3255
      Left            =   0
      ScaleHeight     =   213
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   549
      TabIndex        =   4
      Top             =   1200
      Width           =   8295
   End
   Begin VB.ComboBox 输出声卡选择 
      Height          =   300
      Left            =   1200
      TabIndex        =   2
      Top             =   360
      Width           =   7095
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   8640
      Top             =   120
   End
   Begin VB.ComboBox 声卡选择 
      Height          =   300
      Left            =   1200
      TabIndex        =   0
      Top             =   0
      Width           =   7095
   End
   Begin VB.Label Label3 
      Caption         =   "音量倍数:0.1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1200
      TabIndex        =   6
      Top             =   960
      Width           =   2655
   End
   Begin VB.Label Label2 
      Caption         =   "选择输出设备:"
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   360
      Width           =   3495
   End
   Begin VB.Label Label1 
      Caption         =   "选择输入设备:"
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2655
   End
End
Attribute VB_Name = "声音"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function CreatePen Lib "gdi32.dll" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function Polyline Lib "gdi32.dll" (ByVal hdc As Long, ByRef lpPoint As POINTAPI, ByVal nCount As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
'Download by http://www.codefans.net
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Dim 音频输入 As New clsWaveIn, 音频输出 As New clsWaveOut, 数据处理 As New IWaveOut_Opus
Private 格式质量(19) As String
Dim 缓冲区() As Byte, 缓冲区2() As Integer
Dim 输出声卡 As New OutDevices, 输出声卡数量 As Long
Dim 音量倍数 As Single
Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Sub BX_DblClick()
    波形S.Show
End Sub

Private Sub Form_Load()
    Dim i As Long, s As String
    For i = 0 To 3
        s = "Hz, " + CStr(8 + (i And 2) * 4) + "bit, " + Mid("Mono  Stereo", 1 + (i And 1) * 6, 6)
        格式质量(i) = "11025" + s
        格式质量(i + 4) = "22050" + s
        格式质量(i + 8) = "44100" + s
        格式质量(i + 12) = "48000" + s
        格式质量(i + 16) = "96000" + s
    Next i
    音量倍数 = 1
    声卡选择.Clear
    音频输入.EnumerateWaveInDevice
    For i = 0 To 音频输入.WaveInDeviceCount - 1
        Call 声卡选择.AddItem(音频输入.WaveInDeviceName(i))
        If (i = (音频输入.WaveInDeviceCount - 1)) Then 声卡选择.ListIndex = 0
    Next i
    输出声卡数量 = 输出声卡.initOutDevice
    For i = 0 To 输出声卡数量 - 1
        输出声卡选择.AddItem (输出声卡.GetName(i))
    Next
    输出声卡选择.ListIndex = 0
    Call HScroll1_Change
End Sub

Private Sub Form_Unload(Cancel As Integer)
    音频输入.Destroy
    音频输出.Destroy
    数据处理.Destroy
    Timer1.Enabled = False
    End
End Sub

Private Sub HScroll1_Change()
    音量倍数 = 2 ^ (HScroll1.Value / 8)
    Label3.Caption = ("音量倍数:" & Format((音量倍数), "0.000"))
End Sub

Private Sub HScroll1_Scroll()
    HScroll1_Change
End Sub

Private Sub Timer1_Timer()
    Dim 缓冲区指针 As Long, 缓冲区长度 As Long, i As Long, ii As Long
    If (音频输入.BytesPerChannel = 2) Then
        缓冲区指针 = VarPtr(缓冲区2(0))
    Else
        缓冲区指针 = VarPtr(缓冲区(0))
    End If
    Do
        If (音频输入.ReadRecording(缓冲区指针, 1) = 0) Then Exit Do
        If 音频输入.BytesPerChannel <> 2 Then
            For i = 0 To 音频输入.BufferSize - 1
                缓冲区2(i) = (缓冲区(i) - &H80&) * &H100&
            Next i
        End If
        If 音量倍数 <> 1! Then
            For i = 0 To (音频输入.SamplesPerBuffer * 音频输入.Channels) - 1
                ii = 缓冲区2(i) * 音量倍数
                If ii > &H7FFF& Then ii = &H7FFF&
                If ii < &HFFFF8000 Then ii = &HFFFF8000
                缓冲区2(i) = ii
            Next i
        End If
        'Call 画波形
        Call 数据处理.TestFeed(VarPtr(缓冲区2(0)), ((UBound(缓冲区2) + 1) * 2))
        Call 音频输出.OnTimer
    Loop
    Call 画波形
    Call 画全屏版波形
End Sub

Private Sub 开始()
    Dim i As Long, 频率 As Long
    '参数:声卡编号,频率,?,?,频率/25
    频率 = 44000
    If Not 音频输入.Create(声卡选择.ListIndex, 频率, 2, 2, 频率 / 25, 16) Then
        Exit Sub '创建失败
    End If
    Call 音频输入.StartRecording '开始录音?
    'ReDim 缓冲区(音频输入.BufferSize - 1) As Byte, 缓冲区2((音频输入.BufferSize / 2) - 1) As Integer
    Timer1.Enabled = True
    Call 数据处理.TestStart
    Call 音频输出.Create(频率, 2, 2, 频率 / 25, 2, 输出声卡选择.ListIndex)
    If 音频输出.BytesPerChannel = 2 Then
        ReDim 缓冲区2(音频输入.BufferSize \ 2& - 1) As Integer
    Else
        ReDim 缓冲区(音频输入.BufferSize - 1) As Byte
        ReDim 缓冲区2(音频输入.BufferSize \ 2& - 1) As Integer
    End If
    Set 音频输出.DataObject = 数据处理
    Call 音频输出.Play
End Sub

Private Sub 声卡选择_Click()
    Dim 输入设备格式 As Long, i As Long, l As Long
    If (声卡选择.ListIndex < 0) Then Exit Sub
    输出声卡选择_Click
'    质量选择.Clear
'    输入设备格式 = 音频输入.WaveInDeviceFormats(声卡选择.ListIndex)
'    l = &H1000&
'    For i = 12 To 15
'        If 输入设备格式 And l Then
'            Call 质量选择.AddItem(格式质量(i) & ("[暂时不支持自己设定频率]"))
'            质量选择.ItemData(质量选择.ListCount - 1) = l
'            质量选择.ListIndex = 质量选择.ListCount - 1
'        End If
'    Next i
End Sub

Private Sub 画波形()
    Dim m As Long, w As Long, h As Long, l() As POINTAPI, i As Long, ii As Long, hbr As Long, s As String
    m = 音频输入.SamplesPerBuffer
    ReDim l(m - 1) As POINTAPI
    BX.Cls
    w = BX.Width
    h = BX.Height
    For i = 0 To m - 1
        l(i).X = (i * w) \ m
        l(i).Y = (0.5! - (缓冲区2(i) / 65535!)) * h
    Next i
    Call Polyline(BX.hdc, l(0), m - 1)
End Sub


Private Sub 画全屏版波形()
    Dim m As Long, w As Long, h As Long, l() As POINTAPI, i As Long, ii As Long, hbr As Long, s As String
    m = 音频输入.SamplesPerBuffer
    ReDim l(m - 1) As POINTAPI
    波形S.Cls
    w = 波形S.ScaleWidth
    h = 波形S.ScaleHeight
    For i = 0 To m - 1
        l(i).X = (i * w) \ m
        l(i).Y = (0.5! - (缓冲区2(i) / 65535!)) * h
    Next i
    Call Polyline(波形S.hdc, l(0), m - 1)
End Sub

Private Sub 输出声卡选择_Click()
    音频输入.Destroy
    音频输出.Destroy
    数据处理.Destroy
    Timer1.Enabled = False
    开始
End Sub
