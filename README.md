# twinbasic-dev

一个用于 **WorkBuddy / Claude** 的 Skill，帮助使用 [twinBASIC](https://twinbasic.com/) 编程语言与 IDE 进行开发。

## 功能

- 编写、编译、调试 twinBASIC 项目
- 迁移 VB6 / VBA 项目到 twinBASIC
- twinBASIC 语法、数据类型、Interface/CoClass、泛型、继承、方法重载等参考
- 包管理（TWINPACK、TWINSERV 包仓库、内置包）
- 64 位编译、`LongPtr` / `PtrSafe`、Fusion（32/64 位 ActiveX 桥接）
- 窗体与控件（tbForm 设计器、标准控件、CustomControls、WebView2、CEF）
- IDE 使用（项目资源管理器、调试面板、tbForm/tbReport 设计器、加载项 tbIDE SDK）

## 结构

```
twinbasic-dev/
├── SKILL.md                              # 触发词 + 工作流决策树 + 执行逻辑
├── references/
│   ├── language-features.md              # 语言特性参考
│   ├── packages.md                       # 内置包与控件速查
│   ├── ide-workflow.md                   # IDE 工作流
│   └── vb6-vba-migration.md              # VB6/VBA 迁移指南
└── assets/
    └── examples/
        ├── HelloWorld.bas                # 标准模块示例
        ├── InterfaceExample.cls          # Interface/Class 示例
        ├── WinApi64.bas                  # 64 位 API 声明示例
        └── GenericsExample.bas           # 泛型与方法重载示例
```

## 安装

将整个 `twinbasic-dev` 目录放入 WorkBuddy 的 skills 目录：

- 用户级：`~/.workbuddy/skills/`
- 项目级：`{workspace}/.workbuddy/skills/`

## 参考资料

- 中文文档：https://doc.twinbasic.vb6.pro/official/
- 英文文档：https://docs.twinbasic.com/
- GitHub 仓库：https://github.com/twinbasic/twinbasic
- GitHub Wiki：https://github.com/twinbasic/documentation/wiki
