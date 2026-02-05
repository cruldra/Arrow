---
sidebar_position: 8
---

# 交互节点 (Interaction)

*Interaction*（交互）节点是分支和导航的文本手段。

这种节点类型有一组 `actions`（动作），将作为玩家可以做出的决定呈现给他们，以潜在地改变他们的前进路径和叙事结果。

### 约定

+ 被跳过的 Interaction 不显示任何内容，并播放其第一个连接的出站槽向前。

+ 除非被跳过，Interaction 始终等待用户交互：等待做出决定。

+ 决定的动作即使断开连接也会被播放（即 EOL）。

+ Interaction 选项（动作）预期在其视图中支持最小的 *BBCode* 样式。

+ Interaction 选项（动作）支持[变量](../getting-started/variables-logic)和[角色](../getting-started/characters)标签暴露。

+ 不允许空白动作（即长度为零的动作）。

### 使用

从纯粹的行为角度来看，Interaction 节点类似于独立于角色的 [Dialog](./dialog) 节点，并且始终可播放。

虽然您几乎总是可以用 Dialog 节点实现相同的叙事功能，但它们是为**语义上不同**的目的而设计的。

Interaction 不需要是任何对话的一部分。没有说什么，没有回复什么。它们是纯粹的选择，呈现给玩家。提供要故意做出的决定，采取不同的行动，可能导致不同的子剧情或结果。

为此目的拥有一个独立的节点，有助于我们在运行时开发和创意设计方面保持清晰的工作流程。

### 另请参阅

+ [导航和剧情管理](../getting-started/navigation-plot)
+ [对话 (Dialog)](./dialog)
    > 一种类似但语义不同的文本分支方式。
