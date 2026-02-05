---
sidebar_position: 16
---

# 标签匹配节点 (Tag-Match)

*Tag-Match*（标签匹配）节点被设计为非二元分支门控，非常类似于 `switch` 语句。

它们将播放时内存（控制台或运行时）中[角色](../getting-started/characters)某个标签（通过其键识别）的当前值与节点数据中定义的*模式*列表进行匹配。这些模式可以是简单文本（用于快速精确匹配检查）或正则表达式（如果相应参数设置为活动）。

### 约定

+ Tag-Match 是自动节点：它不等待用户交互。

+ 如果被跳过，Tag-Match 节点播放其第一个连接的出站槽，如果没有连接则播放第一个。

+ 默认情况下允许空白模式，因为标签值可以为空。但请注意，*空的正则表达式匹配所有内容*。阅读[使用](#使用)部分获取更多信息。

+ 为了更好的用户体验，关键字 `--BLANK--` 始终保持并解释为 ""（空字符串），也用于在模式列表中显示该值。

+ 不允许空白标签键和未设置或无效的角色，这会使节点无效。

+ 当节点无效或没有模式匹配时，节点会结束剧情线（EOL）。查看[使用](#使用)部分，如果您需要一个无论如何都通过的通配符模式。

### 使用

Tag-Match 节点可以与 [Tag-Edit](./tag-edit) 和 [Tag-Pass](./tag-pass) 节点一起用于事件管理。与只有两个（true、false）结果并能够一次比较多个标签的 [Tag-Pass](./tag-pass) 相比，匹配节点只检查一个标签，同时将该标签与多个可能的值进行检查，类似于 switch 语句。

想象您正在使用 Arrow 开发一款冒险游戏。在许多场景中，角色谈论他们的个人经历。您希望根据他们对某种情况的感受（例如作为之前 [Dialog](./dialog) 选择的结果，使用 [Tag-Edit](./tag-edit) 节点保存在内存中）提供不同的对话。感受可能不是二元的，它们可以是悲伤、满足、愤怒等。我们可以使用多个 [Tag-Pass](./tag-pass) 节点和一棵二元检查和分支结果的树来检查这个（即检查他们是否悲伤，如果不是则检查他们是否愤怒，以此类推）；但这很快就会变得混乱。更好的选择是将一个标签与多个可能的值进行检查，比如说有一个反映 `_feeling_for_that_situation` 的标签与 [`mad`、`happy`、...] 等模式进行匹配。

由于支持正则表达式，这些模式中的每一个都可以不仅仅是简单的精确匹配检查。例如，如果愿意，您可以将多个可能的值分组到单个模式（例如 `happy|positive|cool`）和一个出站槽中，或者使用一个空（blank）正则表达式作为最后一个选项来通过任何内容，以覆盖一个槽中的杂项值并避免 EOL。

> 正则表达式模式非常常见且强大。您可以找到许多关于其[概念][regexp-concept]和语法的资源，或创建和[测试][regexp-test]它们的工具。
>
>> 技术说明：  
>> Arrow 基于 Godot 工作，其正则表达式实现基于 [PCRE2][regexp-pcre2] 库。  
>> 您可以在其手册上找到 PCRE2 [语法][regexp-pcre2-syntax]和[更多][regexp-pcre2-pat-ref]信息。

### 另请参阅

+ [导航和剧情管理](../getting-started/navigation-plot)
+ [角色](../getting-started/characters)
    > 了解更多标签魔法。
+ [变量](../getting-started/variables-logic)、[变量更新 (Variable-Update)](./variable-update) 和 [条件 (Condition)](./condition)
    > 游戏状态和事件管理的另一种替代方案。
+ [标签编辑 (Tag-Edit)](./tag-edit)
    > 动态创建、删除或操作标签。
+ [标签通过 (Tag-Pass)](./tag-pass)
    > 创建二元事件门控，比较标签集合。

<!-- 绝对链接 -->
[regexp-concept]: https://en.wikipedia.org/wiki/Regular_expression
[regexp-test]: https://regexr.com/
[regexp-pcre2]: https://www.pcre.org
[regexp-pcre2-syntax]: https://www.pcre.org/current/doc/html/pcre2syntax.html
[regexp-pcre2-pat-ref]: https://www.pcre.org/current/doc/html/pcre2pattern.html
