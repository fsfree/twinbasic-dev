' ============================================================
'  HelloWorld.bas  —— 标准模块示例
'  用途：演示 twinBASIC 基本模块结构，可直接放入项目使用
' ============================================================

Option Explicit

Public Sub Main()
    MsgBox "Hello, twinBASIC!"
End Sub

' 字符串处理示例
Public Function ReverseText(ByVal s As String) As String
    Dim i As Long
    Dim result As String
    For i = Len(s) To 1 Step -1
        result = result & Mid(s, i, 1)
    Next i
    ReverseText = result
End Function

' 使用新数据类型 LongLong / LongPtr 的示例
Public Function GetLargeValue() As LongLong
    GetLargeValue = 9223372036854775807#   ' 64 位整数最大值
End Function
