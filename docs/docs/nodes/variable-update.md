---
sidebar_position: 19
---

# 变量更新节点 (Variable-Update)

*Variable-Update*（变量更新）节点修改其目标变量的当前值（在播放时）。

任何[变量](../getting-started/variables-logic)类型都有其自己的操作集（不支持类型转换）。大多数操作接受静态值或另一个变量作为公式的右侧。如果您再次选择目标，将使用变量的初始值作为右侧。

所有必需的参数都可以从*检查器*面板编辑。

### 约定

+ Variable-Update 是自动节点：它不等待用户交互。

+ 被跳过的 Variable-Update 节点播放其唯一的出站槽向前，而不对其目标变量的当前值应用任何更改。

### 使用

Variable-Update 节点非常有用。可能性是无限的。一般来说，它们用于任何我们想要在没有直接用户输入的情况下更改游戏状态的地方。

一个常见的场景是将 Variable-Update 节点与分支节点（如 [Dialog](./dialog) 或 [Interaction](./interaction)）链接起来。

例如，我们可以向玩家提供以下交互选择：1. 杀死怪物 2. 放过敌人。  
这些动作中的每一个都可以连接到一个 Variable-Update 节点，或它们的不同系列，根据玩家的决定更新 `hero_kindness`、`hero_combat_score` 等。

> 对于复杂的可重复逻辑，请考虑宏和 [Macro-Use](./macro-use) 节点。

### 另请参阅

+ [用户输入 (User-Input)](./user-input)
    > 从玩家接收经过验证的输入并将其设置为变量。
+ [生成器 (Generator)](./generator)
    > 为变量设置随机或半随机值。
+ [条件 (Condition)](./condition)
    > 创建二元门控，比较变量和值。
