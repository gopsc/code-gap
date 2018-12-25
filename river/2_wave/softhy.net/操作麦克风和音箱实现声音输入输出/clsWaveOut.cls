VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsWaveOut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'Download by http://www.codefans.net
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Sub ZeroMemory Lib "kernel32.dll" Alias "RtlZeroMemory" (ByRef Destination As Any, ByVal Length As Long)

Private Declare Function waveOutOpen Lib "winmm.dll" (ByRef lphWaveOut As Long, ByVal uDeviceID As Long, ByRef lpFormat As WAVEFORMAT, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
Private Declare Function waveOutReset Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutClose Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutPrepareHeader Lib "winmm.dll" (ByVal hWaveOut As Long, ByRef lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutUnprepareHeader Lib "winmm.dll" (ByVal hWaveOut As Long, ByRef lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutWrite Lib "winmm.dll" (ByVal hWaveOut As Long, ByRef lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutGetPosition Lib "winmm.dll" (ByVal hWaveOut As Long, ByRef lpInfo As MMTIME, ByVal uSize As Long) As Long
Private Declare Function waveOutBreakLoop Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutPause Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutRestart Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutGetVolume Lib "winmm.dll" (ByVal uDeviceID As Long, ByRef lpdwVolume As Long) As Long
Private Declare Function waveOutSetVolume Lib "winmm.dll" (ByVal uDeviceID As Long, ByVal dwVolume As Long) As Long
Private Declare Function waveOutSetPlaybackRate Lib "winmm.dll" (ByVal hWaveOut As Long, ByVal dwRate As Long) As Long

Private Const TIME_MS As Long = &H1
Private Const TIME_SAMPLES As Long = &H2
Private Const TIME_BYTES As Long = &H4

Private Type MMTIME
    wType As Long
    U As Long
    nReserved As Long
End Type

Private Const WAVE_MAPPER As Long = -1& 'Êä³öÉù¿¨±àºÅ
Private Const WAVE_FORMAT_PCM As Long = 1

Private Type WAVEFORMAT
    wFormatTag As Integer
    nChannels As Integer
    nSamplesPerSec As Long
    nAvgBytesPerSec As Long
    nBlockAlign As Integer
    wBitsPerSample As Integer
    cbSize As Integer
End Type

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

Private Const WHDR_DONE As Long = &H1
Private Const WHDR_BEGINLOOP As Long = &H4
Private Const WHDR_ENDLOOP As Long = &H8
Private Const WHDR_INQUEUE As Long = &H10
Private Const WHDR_PREPARED As Long = &H2

Private Const WAVERR_BASE As Long = 32
Private Const WAVERR_STILLPLAYING As Long = (WAVERR_BASE + 1)

Private Type typeHeaderTime '16 bytes
 nWaveOutStart As Long 'samples
 nStart As Long 'samples
 nMax As Long
 nNewStart As Long
End Type

Private m_tFmt As WAVEFORMAT
Private m_hWaveOut As Long

Private m_nSamplesPerBuffer As Long
Private m_nBufferSize As Long
Private m_nBufferCount As Long
'///
Private m_tHdr() As WAVEHDR
Private m_tTime() As typeHeaderTime
Private m_bBuffer() As Byte

Private m_nLastBuffer As Long 'last written buffer
Private m_nCurrentBuffer As Long 'current playing buffer
Private m_bIsEOF As Boolean 'end of file? (if not looping)
'///

Private m_oData As IWaveOut

'0-stop
'1-playing
'2-paused
Private m_nState As Long
Private m_bLoop As Boolean

Private m_nLastWaveOutPos As Long 'samples
Private m_nLastPos As Long 'samples

'///:-3
Private m_bUnchanged As Boolean

'///volume
Private m_nVolume As Long 'left=low-word,right=high-word
Private m_nVolume_Old As Long '??? :-3

'TODO:softwave volume (difficult)

Friend Property Get VolumeLeft() As Long
VolumeLeft = m_nVolume And &HFFFF&
End Property

Friend Property Get VolumeRight() As Long
If m_nVolume < 0 Then
 VolumeRight = ((m_nVolume And &H7FFF0000) \ &H10000) Or &H8000&
Else
 VolumeRight = (m_nVolume And &H7FFF0000) \ &H10000
End If
End Property

Friend Property Let VolumeLeft(ByVal n As Long)
If n < 0 Then n = 0 Else If n > &HFFFF& Then n = &HFFFF&
m_nVolume = (m_nVolume And &HFFFF0000) Or n
If m_hWaveOut Then waveOutSetVolume m_hWaveOut, m_nVolume
End Property

Friend Property Let VolumeRight(ByVal n As Long)
If n < 0 Then n = 0 Else If n > &HFFFF& Then n = &HFFFF&
If n And &H8000& Then
 m_nVolume = (m_nVolume And &HFFFF&) Or ((n And &H7FFF&) * &H10000) Or &H80000000
Else
 m_nVolume = (m_nVolume And &HFFFF&) Or (n * &H10000)
End If
If m_hWaveOut Then waveOutSetVolume m_hWaveOut, m_nVolume
End Property

Friend Sub SetVolume(ByVal nLeft As Long, Optional ByVal nRight As Long = -1)
If nLeft < 0 Then nLeft = 0 Else If nLeft > &HFFFF& Then nLeft = &HFFFF&
If nRight < 0 Then nRight = nLeft Else If nRight > &HFFFF& Then nRight = &HFFFF&
If nRight And &H8000& Then
 m_nVolume = nLeft Or ((nRight And &H7FFF&) * &H10000) Or &H80000000
Else
 m_nVolume = nLeft Or (nRight * &H10000)
End If
If m_hWaveOut Then waveOutSetVolume m_hWaveOut, m_nVolume
End Sub

'return value=chunk index (0-based)
'-1=not playing/invalid size (doesn't clear buffer)
Friend Function GetPlayingData(ByVal lpBuffer As Long, ByVal cbSize As Long) As Long
Dim t As MMTIME
Dim i As Long
GetPlayingData = -1
If m_hWaveOut And m_nState = 1 And cbSize >= m_tFmt.nBlockAlign And cbSize <= m_nBufferSize And (cbSize And (cbSize - 1)) = 0 Then
 t.wType = TIME_BYTES
 waveOutGetPosition m_hWaveOut, t, 12&
 Select Case t.wType
 Case TIME_SAMPLES
  t.U = t.U * m_tFmt.nBlockAlign
 Case TIME_BYTES
 Case Else
  'ERROR
  Exit Function
 End Select
 '///
 i = m_nCurrentBuffer
 Do While (m_tHdr(i).dwFlags And WHDR_DONE) <> 0 And i <> m_nLastBuffer
  i = (i + 1) Mod m_nBufferCount
 Loop
 '///
 If (m_tHdr(i).dwFlags And WHDR_DONE) = 0 Then
  CopyMemory ByVal lpBuffer, ByVal m_tHdr(i).lpData + (t.U And (m_nBufferSize - cbSize)), cbSize
  GetPlayingData = t.U \ cbSize
 End If
End If
End Function

Friend Property Get Position() As Long
Dim t As MMTIME
Dim i As Long
If m_hWaveOut And m_nState > 0 Then
 If m_nLastBuffer < 0 Then
  t.U = m_nLastPos
 Else
  t.wType = TIME_SAMPLES
  waveOutGetPosition m_hWaveOut, t, 12&
  Select Case t.wType
  Case TIME_SAMPLES
  Case TIME_BYTES
   t.U = t.U \ m_tFmt.nBlockAlign
  Case Else
   'ERROR
   Exit Property
  End Select
  '///
  i = m_nCurrentBuffer
  Do While (m_tHdr(i).dwFlags And WHDR_DONE) <> 0 And i <> m_nLastBuffer
   i = (i + 1) Mod m_nBufferCount
  Loop
  With m_tTime(i)
   t.U = t.U - .nWaveOutStart + .nStart
   If t.U > .nMax And .nMax >= 0 Then
    If .nNewStart >= 0 Then
     t.U = .nNewStart + (t.U - .nMax)
    Else
     t.U = .nMax
    End If
   End If
  End With
  '///
 End If
 Position = t.U * (1000 / m_tFmt.nSamplesPerSec)
End If
End Property

Friend Property Get Length() As Long
If Not m_oData Is Nothing Then
 Length = m_oData.Length
End If
End Property

Friend Property Get Looping() As Boolean
Looping = m_bLoop
End Property

Friend Property Let Looping(ByVal b As Boolean)
m_bLoop = b
If b And m_hWaveOut <> 0 And Not m_oData Is Nothing And m_bIsEOF Then
 m_nLastPos = m_oData.SeekSamples(-1)
 m_bIsEOF = m_nLastPos < 0
End If
End Property

Friend Property Get PlayingState() As Long
PlayingState = m_nState
End Property

Friend Sub Play()
If m_hWaveOut <> 0 And Not m_oData Is Nothing Then
 If m_nState = 2 Then 'resume
  waveOutRestart m_hWaveOut
  m_nState = 1
 ElseIf m_nState = 0 Then 'load and play
  If m_nLastBuffer <> -2 Then
   m_nLastPos = m_oData.SeekSamples(0)
  End If
  m_nLastBuffer = -1
  m_bIsEOF = False
  m_nState = 1
  OnTimer
 End If
End If
End Sub

Friend Function SeekTime(ByVal dwMillisecond As Long) As Boolean
SeekTime = SeekSamples(dwMillisecond * (m_tFmt.nSamplesPerSec / 1000))
End Function

Friend Function SeekSamples(ByVal dwSamples As Long) As Boolean
Dim i As Long
If Not m_oData Is Nothing Then
 If m_hWaveOut <> 0 And m_nState > 0 Then
  m_nLastPos = m_oData.SeekSamples(dwSamples)
  SeekSamples = m_nLastPos >= 0
  m_nLastBuffer = -1
  m_bIsEOF = False
  waveOutReset m_hWaveOut
  m_nLastWaveOutPos = 0
  If m_nState = 1 Then OnTimer
'  ElseIf m_nState = 2 Then
'  End If
 Else
  m_nLastPos = m_oData.SeekSamples(dwSamples)
  SeekSamples = m_nLastPos >= 0
  m_nLastBuffer = -2
 End If
End If
End Function

Friend Sub OnTimer()
Dim b As Boolean
Dim i As Long, j As Long, iEnd As Long
Dim lp As Long
If m_hWaveOut <> 0 And Not m_oData Is Nothing And m_nState = 1 Then
 If m_nLastBuffer < 0 Then 'is -1
  '///start new
  If m_nLastPos < 0 Then
   'failed!!!
   m_nState = 0
   Exit Sub
  End If
  m_nCurrentBuffer = 0
  iEnd = m_nBufferCount - 1
 Else
  '///check done
  If (m_tHdr(m_nCurrentBuffer).dwFlags And WHDR_DONE) = 0 Then Exit Sub
  Do While (m_tHdr(m_nCurrentBuffer).dwFlags And WHDR_DONE) <> 0
'   '''debug
'   Debug.Print "Done", m_nCurrentBuffer
'   '''
   b = m_nCurrentBuffer = m_nLastBuffer 'EOF?
   m_nCurrentBuffer = (m_nCurrentBuffer + 1) Mod m_nBufferCount
   If b Then Exit Do
  Loop
  '///EOF?
  If m_bIsEOF Then
   If b Then m_nState = 0
   Exit Sub
  End If
  '///write new (p+1 ~ c-1) bug:gap
  iEnd = (m_nCurrentBuffer + m_nBufferCount - 1) Mod m_nBufferCount
 End If
 '///write
 Do
  m_nLastBuffer = (m_nLastBuffer + 1) Mod m_nBufferCount
  '///read
  i = m_nSamplesPerBuffer
  lp = m_tHdr(m_nLastBuffer).lpData
  With m_tTime(m_nLastBuffer)
   .nWaveOutStart = m_nLastWaveOutPos
   m_nLastWaveOutPos = m_nLastWaveOutPos + i
   .nStart = m_nLastPos
   .nMax = -1
   .nNewStart = -1
  End With
  Do
   j = m_oData.Read(lp, m_tFmt.nSamplesPerSec, m_tFmt.wBitsPerSample \ 8&, m_tFmt.nChannels, i, m_nLastPos)
   If j <= 0 Then 'EOF or fail
    m_tTime(m_nLastBuffer).nMax = m_nLastPos
    If m_bLoop And j = 0 Then
     m_nLastPos = m_oData.SeekSamples(-1)
     If m_nLastPos >= 0 Then
      m_tTime(m_nLastBuffer).nNewStart = m_nLastPos
      j = m_oData.Read(lp, m_tFmt.nSamplesPerSec, m_tFmt.wBitsPerSample \ 8&, m_tFmt.nChannels, i, m_nLastPos)
     End If
    End If
    If j <= 0 Then
     m_bIsEOF = True
     Exit Do
    End If
   End If
   m_nLastPos = m_nLastPos + j
   i = i - j
   lp = lp + j * m_tFmt.nBlockAlign
  Loop Until i = 0
  '///
  If m_bIsEOF Then ZeroMemory ByVal lp, i * m_tFmt.nBlockAlign
  '///
  waveOutWrite m_hWaveOut, m_tHdr(m_nLastBuffer), 32&
'  '''debug
'  Debug.Print "Write", m_nLastBuffer
'  '''
 Loop Until m_nLastBuffer = iEnd Or m_bIsEOF
End If
End Sub

Friend Sub StopPlay()
If m_hWaveOut <> 0 Then
 waveOutReset m_hWaveOut
 m_nState = 0
 m_nLastWaveOutPos = 0
End If
End Sub

Friend Sub Pause()
If m_hWaveOut <> 0 And m_nState = 1 Then
 waveOutPause m_hWaveOut
 m_nState = 2
End If
End Sub

Friend Property Get DataObject() As IWaveOut
Set DataObject = m_oData
End Property

Friend Property Set DataObject(obj As IWaveOut)
If m_hWaveOut = 0 Or m_nState = 0 Then
 Set m_oData = obj
End If
End Property

Friend Function CreateFromDataObject(obj As IWaveOut, Optional ByVal nFrequency As Long, Optional ByVal nBytesPerChannel As Long, Optional ByVal nChannels As Long, Optional ByVal nSamplesPerBuffer As Long, Optional ByVal nBufferCount As Long) As Boolean
StopPlay
If m_hWaveOut Then
 'get old settings
 If nFrequency = 0 Then nFrequency = m_tFmt.nSamplesPerSec
 If nBytesPerChannel = 0 Then nBytesPerChannel = m_tFmt.wBitsPerSample \ 8&
 If nChannels = 0 Then nChannels = m_tFmt.nChannels
 If nSamplesPerBuffer = 0 Then nSamplesPerBuffer = m_nSamplesPerBuffer
 If nBufferCount = 0 Then nBufferCount = m_nBufferCount
End If
If Not obj Is Nothing Then obj.GetDesiredSetting nFrequency, nBytesPerChannel, nChannels
Set m_oData = obj
m_bUnchanged = m_hWaveOut <> 0 And nBytesPerChannel * nChannels = m_tFmt.nBlockAlign And nSamplesPerBuffer = m_nSamplesPerBuffer And nBufferCount = m_nBufferCount
If m_bUnchanged And nFrequency = m_tFmt.nSamplesPerSec Then
 CreateFromDataObject = True
Else
 CreateFromDataObject = Create(nFrequency, nBytesPerChannel, nChannels, nSamplesPerBuffer, nBufferCount)
End If
m_bUnchanged = False
End Function

Friend Function Create(Optional ByVal nFrequency As Long = 48000, Optional ByVal nBytesPerChannel As Long = 2, Optional ByVal nChannels As Long = 2, Optional ByVal nSamplesPerBuffer As Long = 4096&, Optional ByVal nBufferCount As Long = 2&, Optional ByVal OutDeviceID As Long = -1&) As Boolean
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
'create wave out
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
 If Not m_bUnchanged Then
  ReDim m_tHdr(m_nBufferCount - 1)
  ReDim m_tTime(m_nBufferCount - 1)
  ReDim m_bBuffer(m_nBufferCount * m_nBufferSize - 1)
 End If
End With
waveOutOpen m_hWaveOut, OutDeviceID, m_tFmt, 0, 0, 0
waveOutGetVolume m_hWaveOut, m_nVolume_Old '??? :-3
waveOutSetVolume m_hWaveOut, m_nVolume
'///prepare header
For i = 0 To m_nBufferCount - 1
 With m_tHdr(i)
  .lpData = VarPtr(m_bBuffer(0)) + i * m_nBufferSize
  .dwBufferLength = m_nBufferSize
  .dwFlags = 0
  .dwLoops = 0
 End With
 waveOutPrepareHeader m_hWaveOut, m_tHdr(i), 32&
Next i
'///
Create = m_hWaveOut <> 0
End Function

Friend Property Get Handle() As Long
Handle = m_hWaveOut
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

Friend Property Get BufferCount() As Long
BufferCount = m_nBufferCount
End Property

Friend Sub Destroy()
Dim i As Long
If m_hWaveOut Then
 waveOutReset m_hWaveOut
 For i = 0 To m_nBufferCount - 1
  waveOutUnprepareHeader m_hWaveOut, m_tHdr(i), 32&
 Next i
 waveOutSetVolume m_hWaveOut, m_nVolume_Old '??? :-3
 waveOutClose m_hWaveOut
 m_hWaveOut = 0
 m_nState = 0
 m_nLastWaveOutPos = 0
 If Not m_bUnchanged Then Erase m_tHdr, m_bBuffer, m_tTime
End If
End Sub

Private Sub Class_Initialize()
m_nVolume = -1
End Sub

Private Sub Class_Terminate()
Destroy
End Sub
