VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "OutDevices"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Êä³öÉù¿¨Ñ¡Ôñ
'Download by http://www.codefans.net

Option Explicit
Private Declare Function waveOutGetNumDevs Lib "winmm.dll" () As Long
Private Declare Function waveOutGetDevCaps Lib "winmm.dll" Alias "waveOutGetDevCapsA" (ByVal uDeviceID As Long, ByRef lpCaps As WAVEOUTCAPS, ByVal uSize As Long) As Long

Private Type WAVEOUTCAPS
    wMid As Integer
    wPid As Integer
    vDriverVersion As Long
    szPname(31) As Byte
    dwFormats As Long
    wChannels As Integer
    wReserved1 As Integer
    dwSupport As Long
End Type


Dim DeviceData() As WAVEOUTCAPS, DeviceNum As Long

Public Function initOutDevice() As Long
    Dim i As Long
    DeviceNum = waveOutGetNumDevs
    If DeviceNum > 0 Then
        ReDim DeviceData(DeviceNum - 1)
        For i = 0 To (DeviceNum - 1)
            waveOutGetDevCaps i, DeviceData(i), Len(DeviceData(i))
        Next
    Else
        Erase DeviceData
    End If
    initOutDevice = DeviceNum
End Function

Private Function StringChr0(s As String) As String
    Dim i As Long
    i = InStr(1, s, vbNullChar)
    If i > 0 Then s = Left(s, i - 1)
    StringChr0 = s
End Function

Public Function GetName(index As Long) As String
    GetName = (StringChr0(StrConv(DeviceData(index).szPname, vbUnicode)))
End Function
