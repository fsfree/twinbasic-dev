# twinBASIC 语言特性参考

本文档汇总 twinBASIC 相对 VB6/VBA 的核心语言增强，供撰写代码时参考。

## 新数据类型

| 类型 | 说明 |
|------|------|
| `LongLong` | 64 位有符号整数 |
| `LongPtr` | 指针/句柄类型，32 位下等价 `Long`，64 位下等价 `LongLong`。API 声明中应使用 |
| `Decimal` | 原生高精度十进制类型 |

## Interface 与 CoClass

twinBASIC 原生支持接口与组件类声明，替代 VB6 中通过类型库（IDL）定义接口的方式。

```vb
[ InterfaceId("...") ]
Public Interface IShape
    Function Area() As Double
End Interface

[ ClassId("...") ]
Public Class Rectangle Implements IShape
    Private mWidth As Double
    Private mHeight As Double

    Function Area() As Double
        Area = mWidth * mHeight
    End Function
End Class
```

属性（Attribute）可标注 ID、文档、COM 可见性等元数据，如 `[Documentation("...")]`、`[COMCreatable]`。

## 继承

- **Implements Via**：用于基本继承/组合，复用另一类的实现。

```vb
Private This As BaseClass
Public Function New() Implements Via BaseClass
End Function
```

- **Inherits**：用于完整面向对象继承（子类继承父类成员并可覆盖）。

## 泛型

```vb
Public Function Max(Of T)(ByVal a As T, ByVal b As T) As T
    ' ...
End Function
```

## 方法重载

```vb
Public Sub Process(ByVal n As Integer)
End Sub

Public Sub Process(ByVal s As String)
End Sub
```

## 类型推断与属性语法

twinBASIC 支持简化的属性语法与局部类型推断，减少样板代码。

## UDT 增强

用户自定义类型（UDT）可带方法（`Sub`/`Function`）与事件。

## 运算符与字面量

在 VBx 运算符基础上增强，新增若干运算符。详见官方文档「运算符」页。

## 编译器常量与条件编译

使用 `#If` 配合编译器常量（如平台、twinBASIC 版本标识）做条件编译。

## 关键约定

- 保持 VBx 兼容语法书写，绝大多数 VB6/VBA 代码可直接编译。
- 涉及指针/句柄的 API 声明，用 `LongPtr` + `PtrSafe` 以兼容 64 位。
- 接口/类定义使用 `Interface` / `Class` 关键字，替代传统 IDL 方式。
