---
sidebar_position: 13
---

# 随机器节点 (Randomizer)

*Randomizer*（随机器）节点是非常简单但有用的节点，它们将一个入站连接（网格图链接）分成多个出站连接。每次播放该节点时，其中一个将被随机播放。

Randomizer 唯一的参数是其出站 `slots`（槽）的数量。

### 约定

+ Randomizer 是自动节点：它不等待用户交互。

+ 考虑到其自然目的，Randomizer 节点预期至少有两个出站槽。

+ Randomizer 即使被跳过也会履行其存在的职责，并随机播放一个槽。

+ 随机选择的槽即使断开连接也会被播放（即 EOL）。

### 使用

您可以使用 Randomizer 为您的叙事添加变化。它们可以在任何一组节点（类似但有偏差）之前，以创造更丰富多彩的体验。

> 如果您想用随机或半随机值更新[变量](../getting-started/variables-logic)，[Generator](./generator) 节点类型可能是更好的选择。

### 另请参阅

+ [导航和剧情管理](../getting-started/navigation-plot)
+ [集线器 (Hub)](./hub)
    > Randomizer 的完全相反，合并多个分支。
