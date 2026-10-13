# VB6 / VBA 迁移指南

twinBASIC 的目标是与 VB6/VBA 100% 向后兼容，因此绝大多数现有项目代码无需修改即可编译。本指南说明迁移步骤与需要留意的兼容性陷阱。

## 迁移步骤

1. **备份原项目**，记录依赖的第三方 OCX/引用。
2. **在 twinBASIC IDE 中新建项目**，选择与原项目匹配的类型与目标平台。
3. **导入源码**：`.bas`、`.cls`、`.frm` 文件通常可直接导入。
4. **检查引用**：将 VB6 的 OCX 引用替换为对应兼容包（如 `MSCOMCTL.OCX` → `WinNativeCommonCtls`）。
5. **编译验证**：先以 32 位编译，确认与原行为一致，再考虑 64 位。
6. **逐步采用新特性**：迁移成功后，可逐步引入 Interface、继承、泛型等增强（均为可选）。

## 关键新增（迁移后可逐步采用）

- 新数据类型：`LongLong`、`LongPtr`、`Decimal`
- 原生 `Interface` 与 `CoClass` 声明
- 继承：`Implements Via`（基本继承）、`Inherits`（完整 OOP）
- 泛型、方法重载、类型推断、属性语法

## 兼容性陷阱与改造

### 1. API 声明的 64 位兼容

VB6 的 API 声明常使用 `Long` 表示指针/句柄。迁移到 64 位时需改为 `LongPtr` 并加 `PtrSafe`：

```vb
' VB6 风格（仅 32 位）
Private Declare Function GetTickCount Lib "kernel32" () As Long

' twinBASIC 64 位兼容写法
Private Declare PtrSafe Function GetTickCount Lib "kernel32" () As LongPtr
```

### 2. 第三方 OCX / ActiveX 控件

- 标准 `MSCOMCTL.OCX` 控件使用 `WinNativeCommonCtls` 包替代。
- 32 位 ActiveX 控件在 64 位应用中可通过 **Fusion** 桥接托管（通过 IPC 外部宿主进程）。

### 3. 自定义接口

VB6 中接口需通过类型库（IDL/`.tlb`）定义。迁移后可直接用 `Interface` / `Class` 关键字在源码中声明，无需单独的类型库。

### 4. 结构体 / UDT

twinBASIC 的 UDT 可带方法与事件，是增强而非破坏性变更，原 UDT 用法继续有效。

## 常见注意事项

- 遇到编译报错时，先确认是否为 Beta 未实现功能，再查官方 FAQ 与 Wiki。
- 涉及指针运算、`VarPtr`/`StrPtr` 等，注意 64 位下用 `LongPtr`。
- 保留原 VB6 的项目配置（如版本信息、图标）可对照迁移到 twinBASIC 项目配置。

## 参考

- 官方 FAQ：https://github.com/twinbasic/documentation/wiki/twinBASIC-Frequently-Asked-Questions-%28FAQs%29
- 特性列表：https://github.com/twinbasic/documentation/wiki/twinBASIC-Features
