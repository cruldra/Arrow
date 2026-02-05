---
sidebar_position: 6
---

# 生成器节点 (Generator)

*Generator*（生成器）节点可以创建并设置随机或半随机数据到其相应目标[变量](../getting-started/variables-logic)的当前值（在播放时）。

根据目标 `variable` 的类型，生成器的 `method` 参数定义将使用哪种算法进行数据生成。根据 `method` 的不同，预期也会存在不同的 `arguments`。

所有必需的参数都可以从*检查器*面板编辑。

### 约定

+ Generator 是自动节点：它不等待用户交互。

+ 被跳过的 Generator 播放其唯一的出站槽向前，而不对其目标变量的当前值应用任何更改。

### 使用

创建幸运门、掷骰子、从列表中随机选择一个词（例如作为角色名称）等，都是我们可以使用此节点类型的几种方式。

一般来说，Generator 可用于为游戏状态添加随机性（运气）或变化。

### 另请参阅

+ [用户输入 (User-Input)](./user-input)
    > 从玩家接收经过验证的输入并将其设置为变量。
+ [变量更新 (Variable-Update)](./variable-update)
    > 根据另一个变量或静态值操作变量。
+ [条件 (Condition)](./condition)
    > 创建二元门控，比较变量和值。
