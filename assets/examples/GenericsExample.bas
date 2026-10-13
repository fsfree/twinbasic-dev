' ============================================================
'  Generics.bas  —— 泛型与方法重载示例
' ============================================================

Option Explicit

' 泛型函数：返回两个值中的较大者
Public Function Max(Of T)(ByVal a As T, ByVal b As T) As T
    If a > b Then
        Max = a
    Else
        Max = b
    End If
End Function

' 方法重载：同名函数，不同参数类型
Public Sub Process(ByVal n As Long)
    Debug.Print "Integer: " & n
End Sub

Public Sub Process(ByVal s As String)
    Debug.Print "String: " & s
End Sub

' 使用示例
Public Sub Demo()
    Dim i As Long
    i = Max(Of Long)(3, 5)          ' 返回 5
    Process 10                       ' 调用 Integer 重载
    Process "hello"                  ' 调用 String 重载
End Sub
