VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IWaveOut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'Download by http://www.codefans.net
'return value=samples readed
'0=EOF -1=fail
Public Function Read(ByVal lpBuffer As Long, ByVal nFrequency As Long, ByVal nBytesPerChannel As Long, ByVal nChannels As Long, ByVal nSamples As Long, ByVal nCurrentSample As Long) As Long
'
End Function

'0=restart (of course) -1=restart from loop point
'return value=current samples -1=fail
Public Function SeekSamples(ByVal dwSamples As Long) As Long
'
End Function

'return value=ms (<=0 failed eg. infinity :-3 )
Public Property Get Length() As Long
'
End Property

'get desired setting
Public Sub GetDesiredSetting(ByRef nFrequency As Long, ByRef nBytesPerChannel As Long, ByRef nChannels As Long)
'
End Sub

'////////optional function

Public Sub Destroy()
'
End Sub

Public Function LoadFile(ByVal fn As String) As Boolean
'
End Function

Public Function LoadFileFromMemory(ByVal lp As Long, ByVal m As Long) As Boolean
'
End Function

Public Property Get Name() As String
'
End Property

Public Property Get Comments() As String
'
End Property
