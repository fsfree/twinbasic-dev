# twinBASIC 内置包与常用控件速查

## 默认包（自动引用）

| 包 | 内容 |
|----|------|
| **VBA** | 标准运行时库：`MsgBox`、`CStr`、`Format`、`Mid` 等，以及 `Collection`、`Err` 内置对象 |
| **VBRUN** | 运行时类型：`PropertyBag`、环境属性、结构化错误上下文、拖放，以及 VB6 窗体/控件枚举 |
| **VB** | 标准控件（CheckBox、TextBox、CommandButton 等）与应用级单例（`App`、`Screen`、`Clipboard`、`Printer`） |

## 额外 GUI 控件

| 包 | 内容 |
|----|------|
| **CustomControls** | 自绘 `Waynes...` 控件，及用于创作新控件的 DESIGNER 框架 |
| **WinNativeCommonCtls** | `MSCOMCTL.OCX` 的 VB6 兼容替代：DTPicker、ImageList、ListView、MonthView、ProgressBar、Slider、TreeView、UpDown |

## Web 嵌入

| 包 | 说明 |
|----|------|
| **WebView2** | Microsoft Edge 运行时托管 |
| **CEF** | Chromium Embedded Framework（BETA），可选三种 Chromium 运行时 |

## Windows 集成

| 包 | 说明 |
|----|------|
| **WinServicesLib** | 将 twinBASIC EXE 作为一个或多个 Windows 服务运行 |
| **WinEventLogLib** | 写入 Windows 事件日志，支持编译时消息表生成 |
| **WinNamedPipesLib** | 基于 IOCP 的异步命名管道服务器与客户端 |

## 工具链

| 包 | 说明 |
|----|------|
| **Assert** | 单元测试断言函数（三个模块共享十五成员 API，严格程度不同） |
| **tbIDE** | twinBASIC IDE 本身的加载项 SDK |

## 包管理

- 包以 **TWINPACK** 文件分发，集中式仓库名为 **TWINSERV**，可发布公开/私有包。
- 包的浏览、下载、发布集成在 IDE 中。
- 通过项目引用将包作为单个依赖项引入，相关代码组织在命名空间下。

## 常用运行时代码示例

```vb
' 消息框
MsgBox "Hello, twinBASIC!"

' 字符串处理
Dim s As String
s = CStr(123)
s = Format(Now, "yyyy-MM-dd")
s = Mid("twinBASIC", 5, 5)   ' "BASIC"

' 集合
Dim col As New Collection
col.Add "item1"
```

## 标准控件示例

```vb
' 窗体上放置控件后，在事件中编写逻辑
Private Sub CommandButton1_Click()
    TextBox1.Text = "Clicked"
End Sub
```
