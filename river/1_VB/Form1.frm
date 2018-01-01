VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   0  'None
   ClientHeight    =   14070
   ClientLeft      =   3450
   ClientTop       =   210
   ClientWidth     =   21285
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   938
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1419
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton out 
      Caption         =   "退出"
      Height          =   255
      Left            =   1560
      TabIndex        =   8
      Top             =   360
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog dlg 
      Left            =   870
      Top             =   1080
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Timer tmrVis 
      Interval        =   25
      Left            =   1470
      Top             =   1080
   End
   Begin VB.ComboBox cboDev 
      Height          =   315
      Left            =   0
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   0
      Width           =   1575
   End
   Begin VB.ComboBox cboRecLine 
      Height          =   315
      Left            =   0
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   360
      Width           =   1575
   End
   Begin VB.CheckBox chkStereo 
      Caption         =   "立体声"
      Height          =   240
      Left            =   1440
      TabIndex        =   4
      Top             =   720
      Width           =   870
   End
   Begin VB.ComboBox cboSamplerate 
      Height          =   315
      ItemData        =   "Form1.frx":0000
      Left            =   0
      List            =   "Form1.frx":0002
      TabIndex        =   3
      Text            =   "6"
      Top             =   720
      Width           =   1410
   End
   Begin VB.CommandButton cmdDo 
      Caption         =   "开始"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1560
      TabIndex        =   2
      Top             =   0
      Width           =   1515
   End
   Begin VB.PictureBox picFreq 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      FillStyle       =   0  'Solid
      Height          =   13890
      Left            =   7200
      ScaleHeight     =   922
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   915
      TabIndex        =   1
      Top             =   0
      Width           =   13785
   End
   Begin VB.PictureBox picAmpl 
      BackColor       =   &H00000000&
      FillStyle       =   0  'Solid
      Height          =   11130
      Left            =   1800
      ScaleHeight     =   738
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   331
      TabIndex        =   0
      Top             =   1440
      Width           =   5025
   End
   Begin ComctlLib.Slider sldVol 
      Height          =   345
      Left            =   0
      TabIndex        =   5
      Top             =   1320
      Width           =   3090
      _ExtentX        =   5450
      _ExtentY        =   609
      _Version        =   327682
      LargeChange     =   2000
      Max             =   65535
      TickStyle       =   3
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' VU gradient colors
Private Const COLOR_START       As Long = vbGreen
Private Const COLOR_MIDDLE      As Long = &H22A8E1
Private Const COLOR_END         As Long = vbRed

' the bigger, the smoother
Private Const VU_SMOOTH_LEN     As Long = 3

Private WithEvents clsRecorder  As WaveInRecorder
Attribute clsRecorder.VB_VarHelpID = -1


Private clsVis                  As clsDraw
Private intSamples()            As Integer


Private lngMSEncoded            As Long
Private lngBytesPerSec          As Long

Private blnLoaded               As Boolean

Private Sub cboDev_Click()
    cboRecLine.Clear

    If Not clsRecorder.SelectDevice(cboDev.ListIndex) Then
        MsgBox "Couldn't select device!", vbExclamation
        Exit Sub
    End If

    ShowLines
End Sub

Private Sub cboRecLine_Click()
    If Not clsRecorder.SelectMixerLine(cboRecLine.ListIndex) Then
        MsgBox "Couldn't select mixer line!", vbExclamation
    End If

    ' MixerLineType can be used to automaticaly find and set
    ' the line you want to record from, e.g. microphone.
    ' MixerLine also accepts a line id as a parameter,
    ' pass -1 and the currently selected line is returned.
    Debug.Print "Line Type: ";
    Select Case clsRecorder.MixerLineType
        Case MIXERLINE_ANALOG:      Debug.Print "Analog"
        Case MIXERLINE_AUXILIARY:   Debug.Print "Auxiliary"
        Case MIXERLINE_COMPACTDISC: Debug.Print "Compact Disc"
        Case MIXERLINE_DIGITAL:     Debug.Print "Digital"
        Case MIXERLINE_LINE:        Debug.Print "Line-In"
        Case MIXERLINE_MICROPHONE:  Debug.Print "Microphone"
        Case MIXERLINE_PCSPEAKER:   Debug.Print "PC Speaker"
        Case MIXERLINE_SYNTHESIZER: Debug.Print "Synthesizer"
        Case MIXERLINE_TELEPHONE:   Debug.Print "Telephone"
        Case MIXERLINE_UNDEFINED:   Debug.Print "Undefined"
        Case MIXERLINE_WAVEOUT:     Debug.Print "WaveOut"
        Case Else:                  Debug.Print "Unknown"
    End Select

    sldVol.value = clsRecorder.MixerLineVolume
    sldVol_Scroll
End Sub

Private Sub cboSamplerate_Click()
    ' the currently selected WAV output codec
    ' couldn't support resampling, so force the
    ' user to select a new format which is
    ' compatible to the new samplerate

End Sub

Private Sub cboSamplerate_KeyPress( _
    KeyAscii As Integer _
)

    If KeyAscii <> vbKeyBack Then
        If Not IsNumeric(Chr(KeyAscii)) Then
            KeyAscii = 0
        Else
            If Len(cboSamplerate.Text) = 5 Then
                KeyAscii = 0
            End If
        End If
    End If
End Sub


Private Sub chkStereo_Click()
    ' the currently selected WAV output codec
    ' couldn't support channel mixing, so force the
    ' user to select a new format which is
    ' compatible to the new channels count

End Sub

' waveIn returns a buffer to the app
Private Sub clsRecorder_GotData( _
    intBuffer() As Integer, _
    lngLen As Long _
)

    ' save the current buffer for visualizing it
    intSamples = intBuffer

 ' GotData could also be raised after recording
    ' got stopped because a buffer was just finished
    ' when StopRecord got called
    If Not clsRecorder.IsRecording Then Exit Sub

    ' update recorded time

End Sub

Private Sub cmdBrowse_Click()
    Dim strExt  As String




End Sub

Private Sub cmdDo_Click()


        If cboDev.ListIndex = -1 Then
            MsgBox "没有选择硬件设备!", vbExclamation, "提示"
            Exit Sub
        End If
        If Not clsRecorder.StartRecord(cboSamplerate.Text, chkStereo.value + 1) Then
        End If
End Sub


Private Sub Form_Load()

    Set clsRecorder = New WaveInRecorder
 
    Set clsVis = New clsDraw


    cboSamplerate.Text = "44100"
    chkStereo.value = 1

    ReDim intSamples(FFT_SAMPLES - 1) As Integer

    blnLoaded = True

    
    ShowDevices

    Me.Show
End Sub

Private Sub ShowDevices()
    Dim i   As Long

    cboDev.Clear

    For i = 0 To clsRecorder.DeviceCount - 1
        cboDev.AddItem clsRecorder.DeviceName(i)
    Next
End Sub

Private Sub ShowLines()
    Dim i   As Long

    cboRecLine.Clear

    For i = 0 To clsRecorder.MixerLineCount - 1
        cboRecLine.AddItem clsRecorder.MixerLineName(i)
    Next

    cboRecLine.ListIndex = clsRecorder.SelectedMixerLine
End Sub

Private Sub Form_Unload( _
    Cancel As Integer _
)

    If clsRecorder.IsRecording Then
        cmdDo_Click
    End If

    Set clsRecorder = Nothing
End Sub

Private Sub lblVolPer_Click()

End Sub

Private Sub lblVol_Click()

End Sub

Private Sub out_Click()
End
End Sub

Private Sub sldVol_Click()
    sldVol_Scroll
End Sub

Private Sub sldVol_Scroll()
    clsRecorder.MixerLineVolume = sldVol.value

End Sub

Private Sub tmrVis_Timer()
    Dim lngMaxL As Long
    Dim lngMaxR As Long

    If clsRecorder.IsRecording Then
        ' frequency spectrum
        clsVis.DrawAmplitudes intSamples, picAmpl
        ' amplitude curve
        clsVis.DrawFrequencies intSamples, picFreq

        ' VU meter
        If chkStereo.value = 1 Then
            lngMaxL = GetArrayMaxAbs(intSamples, 0, 2)
            lngMaxR = GetArrayMaxAbs(intSamples, 1, 2)
        Else
            lngMaxL = GetArrayMaxAbs(intSamples)
            lngMaxR = lngMaxL
        End If

        If lngMaxL = 0 Then lngMaxL = 1
        If lngMaxR = 0 Then lngMaxR = 1
   End If
End Sub

Private Function FmtTime( _
    ByVal lngMS As Long _
) As String

    Dim lngMin  As Long
    Dim lngSec  As Long

    lngSec = lngMS / 1000
    lngMin = lngSec \ 60
    lngSec = lngSec Mod 60

    FmtTime = lngMin & ":" & Format(lngSec, "00")
End Function


' get the greatest absolute value in an array of samples
Private Function GetArrayMaxAbs( _
    intArray() As Integer, _
    Optional ByVal offStart As Long = 0, _
    Optional ByVal steps As Long = 1 _
) As Long

    Dim lngTemp As Long
    Dim lngMax  As Long
    Dim i       As Long

    For i = offStart To UBound(intArray) Step steps
        lngTemp = Abs(CLng(intArray(i)))
        If lngTemp > lngMax Then
            lngMax = lngTemp
        End If
    Next

    GetArrayMaxAbs = lngMax
End Function

Private Sub DrawVU( _
    ByVal picbox As PictureBox, _
    ByVal value As Single _
)

    Dim lngColor    As Long

    lngColor = GetGradColor(1, value, COLOR_START, COLOR_MIDDLE, COLOR_END)

    picbox.Cls
    clsVis.DrawRect picbox.hdc, 0, 0, value * picbox.Width, picbox.Height, lngColor
End Sub
