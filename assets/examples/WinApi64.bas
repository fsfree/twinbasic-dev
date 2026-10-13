' ============================================================
'  WinApi64.bas  —— 64 位兼容 API 声明示例
'  演示 LongPtr + PtrSafe 的正确写法
' ============================================================

Option Explicit

' 64 位兼容：指针/句柄使用 LongPtr，并加 PtrSafe 关键字
Private Declare PtrSafe Function GetTickCount Lib "kernel32" () As Long
Private Declare PtrSafe Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleW" (ByVal lpModuleName As LongPtr) As LongPtr
Private Declare PtrSafe Function GetWindowText Lib "user32" Alias "GetWindowTextW" (ByVal hWnd As LongPtr, ByVal lpString As LongPtr, ByVal nMaxCount As Long) As Long

' 使用示例
Public Function ElapsedMilliseconds() As Long
    ElapsedMilliseconds = GetTickCount()
End Function
