VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsWaveIn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'Download by http://www.codefans.net
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Sub ZeroMemory Lib "kernel32.dll" Alias "RtlZeroMemory" (ByRef Destination As Any, ByVal Length As Long)

Private Declare Function waveInOpen Lib "winmm.dll" (ByRef lphWaveIn As Long, ByVal uDeviceID As Long, ByRef lpFormat As WAVEFORMAT, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
Private Declare Function waveInClose Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveInGetNumDevs Lib "winmm.dll" () As Long
Private Declare Function waveInGetDevCaps Lib "winmm.dll" Alias "waveInGetDevCapsA" (ByVal uDeviceID As Long, ByRef lpCaps As WAVEINCAPS, ByVal uSize As Long) As Long
Private Declare Function waveInPrepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, ByRef lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveInUnprepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, ByRef lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveInAddBuffer Lib "winmm.dll" (ByVal hWaveIn As Long, ByRef lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveInStart Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveInStop Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveInReset Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Private Type WAVEFORMAT
    wFormatTag As Integer
    nChannels As Integer
    nSamplesPerSec As Long
    nAvgBytesPerSec As Long
    nBlockAlign As Integer
    wBitsPerSample As Integer
    cbSize As Integer
End Type

Private Type WAVEINCAPS
    wMid As Integer
    wPid As Integer
    vDriverVersion As Long
    szPname(31) As Byte
    dwFormats As Long
    wChannels As Integer
    wReserved1 As Integer
End Type

Private Const WAVE_FORMAT_1M08 As Long = &H1&
Private Const WAVE_FORMAT_1S08 As Long = &H2&
Private Const WAVE_FORMAT_1M16 As Long = &H4&
Private Const WAVE_FORMAT_1S16 As Long = &H8&
Private Const WAVE_FORMAT_2M08 As Long = &H10&
Private Const WAVE_FORMAT_2S08 As Long = &H20&
Private Const WAVE_FORMAT_2M16 As Long = &H40&
Private Const WAVE_FORMAT_2S16 As Long = &H80&
Private Const WAVE_FORMAT_4M08 As Long = &H100&
Private Const WAVE_FORMAT_4S08 As Long = &H200&
Private Const WAVE_FORMAT_4M16 As Long = &H400&
Private Const WAVE_FORMAT_4S16 As Long = &H800&
Private Const WAVE_FORMAT_48M08 As Long = &H1000&
Private Const WAVE_FORMAT_48S08 As Long = &H2000&
Private Const WAVE_FORMAT_48M16 As Long = &H4000&
Private Const WAVE_FORMAT_48S16 As Long = &H8000&
Private Const WAVE_FORMAT_96M08 As Long = &H10000
Private Const WAVE_FORMAT_96S08 As Long = &H20000
Private Const WAVE_FORMAT_96M16 As Long = &H40000
Private Const WAVE_FORMAT_96S16 As Long = &H80000

Private m_nWaveInDeviceCount As Long
Private m_tWaveInDevice() As WAVEINCAPS

Private Type WAVEHDR
    lpData As Long
    dwBufferLength As Long
    dwBytesRecorded As Long
    dwUser As Long
    dwFlags As Long
    dwLoops As Long
    lpNext As Long
    Reserved As Long
End Type

Private Const WAVE_MAPPER As Long = -1&
Private Const WAVE_FORMAT_PCM As Long = 1

Private Const WHDR_DONE As Long = &H1
Private Const WHDR_BEGINLOOP As Long = &H4
Private Const WHDR_ENDLOOP As Long = &H8
Private Const WHDR_INQUEUE As Long = &H10
Private Const WHDR_PREPARED As Long = &H2

Private m_tFmt As WAVEFORMAT
Private m_hWaveIn As Long

Private m_nSamplesPerBuffer As Long
Private m_nBufferSize As Long
Private m_nBufferCount As Long

Private m_tHdr() As WAVEHDR
Private m_bBuffer() As Byte

Private m_bRecording As Boolean

Private m_nLastBuffer As Long

Friend Property Get IsRecording() As Boolean
IsRecording = m_bRecording
End Property

Friend Sub Destroy()
Dim i As Long
If m_hWaveIn Then
 waveInReset m_hWaveIn
 For i = 0 To m_nBufferCount - 1
  waveInUnprepareHeader m_hWaveIn, m_tHdr(i), 32&
 Next i
 waveInClose m_hWaveIn
 m_hWaveIn = 0
 m_bRecording = False
 Erase m_tHdr, m_bBuffer
End If
End Sub

Friend Function EnumerateWaveInDevice() As Long
Dim i As Long
m_nWaveInDeviceCount = waveInGetNumDevs
If m_nWaveInDeviceCount = 0 Then
 Erase m_tWaveInDevice
Else
 ReDim m_tWaveInDevice(m_nWaveInDeviceCount - 1)
 For i = 0 To m_nWaveInDeviceCount - 1
  waveInGetDevCaps i, m_tWaveInDevice(i), Len(m_tWaveInDevice(0))
 Next i
End If
End Function

Friend Property Get WaveInDeviceCount() As Long
WaveInDeviceCount = m_nWaveInDeviceCount
End Property

Friend Property Get WaveInDeviceName(ByVal nIndex As Long) As String
Dim s As String, i As Long
If nIndex >= 0 And nIndex < m_nWaveInDeviceCount Then
 s = StrConv(m_tWaveInDevice(nIndex).szPname, vbUnicode)
 i = InStr(1, s, vbNullChar)
 If i > 0 Then s = Left(s, i - 1)
 WaveInDeviceName = s
End If
End Property

Friend Property Get WaveInDeviceFormats(ByVal nIndex As Long) As Long
If nIndex >= 0 And nIndex < m_nWaveInDeviceCount Then
 WaveInDeviceFormats = m_tWaveInDevice(nIndex).dwFormats
End If
End Property

Friend Function Create(Optional ByVal nIndex As Long = -1, Optional ByVal nFrequency As Long = 48000, Optional ByVal nBytesPerChannel As Long = 2, Optional ByVal nChannels As Long = 2, Optional ByVal nSamplesPerBuffer As Long = 1024&, Optional ByVal nBufferCount As Long = 16&) As Boolean
Dim i As Long
'///
If nFrequency <= 0 _
Or nChannels < 1 Or nChannels > 2 _
Or (nBytesPerChannel <> 1 And nBytesPerChannel <> 2 And nBytesPerChannel <> 4) _
Or nSamplesPerBuffer <= 0 _
Or nBufferCount < 2 _
Then Exit Function
'///
Destroy
'///create wave in
With m_tFmt
 .wFormatTag = WAVE_FORMAT_PCM
 .nChannels = nChannels
 .nSamplesPerSec = nFrequency
 .nBlockAlign = nBytesPerChannel * nChannels
 .nAvgBytesPerSec = nFrequency * .nBlockAlign
 .wBitsPerSample = nBytesPerChannel * 8&
 '///
 m_nSamplesPerBuffer = nSamplesPerBuffer
 m_nBufferSize = nSamplesPerBuffer * .nBlockAlign
 m_nBufferCount = nBufferCount
 '///create buffer
 ReDim m_tHdr(m_nBufferCount - 1)
 ReDim m_bBuffer(m_nBufferCount * m_nBufferSize - 1)
 '///
End With
If waveInOpen(m_hWaveIn, nIndex, m_tFmt, 0, 0, 0) <> 0 Then
 m_hWaveIn = 0
 Exit Function
End If
'///prepare header and add it to queue
m_nLastBuffer = 0
For i = 0 To m_nBufferCount - 1
 With m_tHdr(i)
  .lpData = VarPtr(m_bBuffer(0)) + i * m_nBufferSize
  .dwBufferLength = m_nBufferSize
  .dwFlags = 0
  .dwLoops = 0
 End With
 waveInPrepareHeader m_hWaveIn, m_tHdr(i), 32&
 waveInAddBuffer m_hWaveIn, m_tHdr(i), 32&
Next i
'///over
Create = True
End Function

Friend Function StartRecording() As Boolean
If m_hWaveIn Then
 If Not m_bRecording Then
  m_bRecording = waveInStart(m_hWaveIn) = 0
 End If
 StartRecording = m_bRecording
End If
End Function

Friend Function StopRecording() As Boolean
If m_hWaveIn Then
 If m_bRecording Then
  m_bRecording = waveInStop(m_hWaveIn) <> 0
 End If
 StopRecording = Not m_bRecording
End If
End Function

'lpBuffer: pointer to buffer
'nMaxBufferCount: buffer chunk count in lpBuffer
'return value: >=0 means returned buffer chunk count, -1 failed
Friend Function ReadRecording(ByVal lpBuffer As Long, ByVal nMaxBufferCount As Long) As Long
Dim nCount As Long
'///
If m_hWaveIn = 0 Then
 ReadRecording = -1
 Exit Function
End If
'///
Do While nCount < nMaxBufferCount
 If (m_tHdr(m_nLastBuffer).dwFlags And WHDR_DONE) = 0 Then Exit Do
 nCount = nCount + 1
 '///read data
 CopyMemory ByVal lpBuffer, ByVal m_tHdr(m_nLastBuffer).lpData, m_nBufferSize
 lpBuffer = lpBuffer + m_nBufferSize
 '///add it to queue again
 m_tHdr(m_nLastBuffer).dwFlags = m_tHdr(m_nLastBuffer).dwFlags And Not WHDR_DONE
 If waveInAddBuffer(m_hWaveIn, m_tHdr(m_nLastBuffer), 32&) <> 0 Then
  'something goes wrong
  Debug.Print "Error!!!"
  ReadRecording = -1
  Exit Function
 End If
 '///go to next chunk
 m_nLastBuffer = m_nLastBuffer + 1
 If m_nLastBuffer >= m_nBufferCount Then m_nLastBuffer = 0
Loop
'///
ReadRecording = nCount
End Function

Private Sub Class_Terminate()
Destroy
End Sub

Friend Property Get Handle() As Long
Handle = m_hWaveIn
End Property

Friend Property Get BytesPerChannel() As Long
BytesPerChannel = m_tFmt.wBitsPerSample \ 8&
End Property

Friend Property Get Channels() As Long
Channels = m_tFmt.nChannels
End Property

Friend Property Get SamplesPerBuffer() As Long
SamplesPerBuffer = m_nSamplesPerBuffer
End Property

'buffer chunk size in bytes
Friend Property Get BufferSize() As Long
BufferSize = m_nBufferSize
End Property

Friend Property Get BufferCount() As Long
BufferCount = m_nBufferCount
End Property

Friend Property Get Frequency() As Long
Frequency = m_tFmt.nSamplesPerSec
End Property
