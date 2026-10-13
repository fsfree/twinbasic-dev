' ============================================================
'  IShape.cls  —— Interface / Class 示例
'  演示 twinBASIC 原生 Interface 与 Class 声明（替代 IDL）
' ============================================================

Option Explicit

' 定义接口
Public Interface IShape
    Function Area() As Double
    Function Name() As String
End Interface

' 实现接口的类
Public Class Circle Implements IShape
    Private mRadius As Double

    Public Sub New(ByVal radius As Double)
        mRadius = radius
    End Sub

    Function Area() As Double
        Area = 3.14159265358979 * mRadius * mRadius
    End Function

    Function Name() As String
        Name = "Circle"
    End Function
End Class

' 实现接口的类
Public Class Rectangle Implements IShape
    Private mWidth As Double
    Private mHeight As Double

    Public Sub New(ByVal w As Double, ByVal h As Double)
        mWidth = w
        mHeight = h
    End Sub

    Function Area() As Double
        Area = mWidth * mHeight
    End Function

    Function Name() As String
        Name = "Rectangle"
    End Function
End Class
