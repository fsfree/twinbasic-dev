---
name: twinbasic-dev
description: 使用 twinBASIC 编程语言与 IDE 进行开发。当用户需要编写、编译、调试、迁移（VB6/VBA 转 twinBASIC）twinBASIC 项目，或询问 twinBASIC 语法、数据类型、Interface/CoClass、泛型、继承、包管理、64 位编译、窗体与控件等任何 twinBASIC 相关开发问题时，应使用此技能。
---

# twinBASIC 开发

## 概述

twinBASIC 是一门现代 BASIC 编程语言及集成开发环境（IDE），致力于与 VB6 和 VBA 实现 100% 向后兼容，同时引入泛型、原生 Interface/CoClass、继承（Implements Via / Inherits）、方法重载、类型推断、包管理等现代语言特性，并支持编译原生 32 位与 64 位可执行文件。目前处于 Beta 阶段，编译器与 IDE 均在积极开发中。

此技能使助手能够指导用户使用 twinBASIC IDE 完成从项目创建、代码编写、编译调试到发布的全流程开发。

## 触发场景

当用户请求涉及以下任一方面时触发此技能：

- 编写、创建、修改 twinBASIC 项目或源码（`.twinproj`、`.bas`、`.cls`、`.frm` 等）
- 编译、运行、调试 twinBASIC 代码
- 将现有 VB6 / VBA 项目迁移到 twinBASIC
- 询问 twinBASIC 语法、关键字、数据类型、语句、函数、运算符
- 使用 Interface / CoClass / Implements Via / Inherits / 泛型 / 方法重载等语言特性
- 包管理（TWINPACK、TWINSERV 包仓库、内置包引用）
- 64 位编译、LongPtr / PtrSafe、Fusion（32/64 位 ActiveX 桥接）
- 窗体、控件（tbForm 设计器、标准控件、CustomControls、WebView2、CEF）
- IDE 使用（项目资源管理器、调试面板、tbForm/tbReport 设计器、加载项 tbIDE SDK）

## 工作流决策树

按用户意图选择对应路径：

```
用户请求
├─ 创建新项目 → 见「新建项目」
├─ 编写代码 → 见「编写代码」，参考 references/language-features.md
├─ 编译/运行/调试 → 见「编译与调试」
├─ 迁移 VB6/VBA 项目 → 见「迁移 VB6/VBA」，参考 references/vb6-vba-migration.md
├─ 语法/API 查询 → 参考 references/language-features.md 与 references/packages.md
├─ GUI/控件开发 → 见「窗体与控件」
└─ 64 位/高级特性 → 见「64 位与高级特性」
```

## 新建项目

1. 确认项目类型：标准 EXE、标准 DLL、控制台应用程序、Windows 服务、内核驱动、ActiveX 控件等。
2. 项目文件使用 `.twinproj` 扩展名，源码文件沿用 VB6 约定：`.bas`（模块）、`.cls`（类）、`.frm`（窗体）。
3. 引导用户通过 IDE 菜单创建项目，或直接生成 `.twinproj` 及源码文件内容供其粘贴。

## 编写代码

twinBASIC 代码与 VB6/VBA 语法高度兼容，绝大多数现有 VBx 代码无需修改即可编译。撰写代码时遵循：

- 默认每个项目自动引用内置包：**VBA**（`MsgBox`、`CStr`、`Format`、`Mid` 等运行时）、**VBRUN**（`PropertyBag`、窗体/控件枚举、结构化错误上下文）、**VB**（标准控件与 `App`、`Screen`、`Clipboard`、`Printer` 等单例）。
- 声明使用 VBx 风格：`Dim` / `Public` / `Private`，过程用 `Sub` / `Function` / `Property Get/Let/Set`。
- 数据类型兼容 VBx，并新增 `LongLong`、`LongPtr`、`Decimal`。
- 详细语法、示例与新增特性见 `references/language-features.md`。
- 代码示例可参考 `assets/examples/` 下的模板文件。

## 编译与调试

- 编译前确认目标平台（32 位 / 64 位）与项目类型设置正确。
- 调试工具窗口：调用堆栈、监视、变量、调试控制台、诊断、大纲、内存，在调试会话期间打开。
- 使用 `Debug.Print` 输出到调试控制台；通过断点、单步执行、监视表达式定位问题。
- 编译器警告与严格模式可用于提升代码质量。
- 详见 `references/ide-workflow.md`。

## 迁移 VB6/VBA 项目

- 大多数 VB6/VBA 代码可直接编译，但需注意少数不兼容点与 64 位下指针/句柄类型调整。
- 迁移步骤、常见兼容性陷阱与改造示例见 `references/vb6-vba-migration.md`。

## 窗体与控件

- 使用 tbForm 设计器可视化设计窗体；tbReport 设计器用于报表。
- 标准控件（CheckBox、TextBox、CommandButton 等）来自 `VB` 包。
- 额外 GUI 控件：`CustomControls`（自绘控件）、`WinNativeCommonCtls`（`MSCOMCTL.OCX` 兼容替代：ListView、TreeView、ProgressBar 等）。
- Web 嵌入：`WebView2`（Edge 运行时）、`CEF`（Chromium Embedded Framework）。
- 详见 `references/packages.md`。

## 64 位与高级特性

- 使用 `LongPtr` 数据类型与 `PtrSafe` 关键字标记 API 声明以支持 64 位编译。
- Fusion 使 64 位应用可托管 32 位 ActiveX 控件（反之亦然），通过 IPC 桥接。
- 多线程通过直接 API 调用实现；`Emit()` 可插入汇编代码；支持 OBJ/LIB 静态链接。
- 详见 `references/language-features.md`。

## 资源

- `references/language-features.md` —— 语言语法、数据类型、Interface/CoClass、继承、泛型、重载等详细参考与示例。
- `references/packages.md` —— 内置包清单与常用控件/API 速查。
- `references/ide-workflow.md` —— IDE 各面板、调试、项目配置工作流。
- `references/vb6-vba-migration.md` —— VB6/VBA 迁移指南与兼容性陷阱。
- `assets/examples/` —— 可直接复用的项目模板与代码示例。

## 外部文档

- 中文文档：https://doc.twinbasic.vb6.pro/official/
- 英文文档：https://docs.twinbasic.com/
- GitHub 仓库：https://github.com/twinbasic/twinbasic
- GitHub Wiki（FAQ 与特性列表）：https://github.com/twinbasic/documentation/wiki
- 下载（Releases）：https://github.com/twinbasic/twinbasic/releases

## 重要约定

- 对不掌握的 API 细节或尚未实现（Beta 未完成）的功能，明确告知用户并建议查阅上述官方文档，不要凭空编造语法或函数。
- 代码示例优先保证可编译、符合 VBx 兼容语法；涉及 64 位时提醒 `LongPtr` / `PtrSafe` 处理。
- 输出代码时标注文件扩展名与所属项目文件，便于用户直接放入 IDE 使用。
