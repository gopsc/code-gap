VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IWaveOut_Opus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Sub ZeroMemory Lib "kernel32.dll" Alias "RtlZeroMemory" (ByRef Destination As Any, ByVal Length As Long)

'test only
Private m_m As Long
Private m_b() As Byte, m_i As Long, m_nSize As Long, m_bUnderflow As Boolean

Implements IWaveOut

Friend Sub TestStart()
m_m = 262144
ReDim m_b(m_m - 1)
m_i = 0
m_nSize = 0
m_bUnderflow = True
End Sub

Friend Sub TestFeed(ByVal lp As Long, ByVal nSize As Long)
Dim i As Long, j As Long
If m_nSize + nSize > m_m Then Exit Sub
i = (m_i + m_nSize) And (m_m - 1)
j = m_m - i
If nSize > j Then
 CopyMemory m_b(i), ByVal lp, j
 CopyMemory m_b(0), ByVal lp + j, nSize - j
Else
 CopyMemory m_b(i), ByVal lp, nSize
End If
m_nSize = m_nSize + nSize
If m_nSize > 1024 Then m_bUnderflow = False '1024, 12288 is for 48khz 16bit stereo
If m_nSize > 32768 Then
 i = (i + (m_nSize - 32768)) And (m_m - 1)
 m_nSize = 32768
End If
End Sub

Private Sub Class_Terminate()
Destroy
End Sub

Private Property Get IWaveOut_Comments() As String
'unsupported
End Property

Private Sub IWaveOut_Destroy()
Destroy
End Sub

Private Sub IWaveOut_GetDesiredSetting(nFrequency As Long, nBytesPerChannel As Long, nChannels As Long)
nFrequency = 48000
nBytesPerChannel = 16
nChannels = 2
End Sub

Private Property Get IWaveOut_Length() As Long
'unsupported
IWaveOut_Length = -1
End Property

Private Function IWaveOut_LoadFile(ByVal fn As String) As Boolean
'unsupported
End Function

Private Function IWaveOut_LoadFileFromMemory(ByVal lp As Long, ByVal m As Long) As Boolean
'unsupported
End Function

Private Property Get IWaveOut_Name() As String
'unsupported
End Property

Private Function IWaveOut_Read(ByVal lpBuffer As Long, ByVal nFrequency As Long, ByVal nBytesPerChannel As Long, ByVal nChannels As Long, ByVal nSamples As Long, ByVal nCurrentSample As Long) As Long
'test only
Dim m As Long, n As Long
m = nBytesPerChannel * nChannels
'///
If m_bUnderflow Then
 ZeroMemory ByVal lpBuffer, m * nSamples
 IWaveOut_Read = nSamples
Else
 n = m_m - m_i
 If n > m_nSize Then n = m_nSize
 If n > m * nSamples Then n = m * nSamples
 If n > 0 Then CopyMemory ByVal lpBuffer, m_b(m_i), n
 m_nSize = m_nSize - n
 m_bUnderflow = m_nSize = 0
 m_i = (m_i + n) And (m_m - 1)
 IWaveOut_Read = n \ m
End If
'///
End Function

Private Function IWaveOut_SeekSamples(ByVal dwSamples As Long) As Long
'unsupported
End Function

Friend Sub Destroy()
'TODO:
End Sub
