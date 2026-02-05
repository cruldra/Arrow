---
sidebar_position: 18
---

# 用户输入节点 (User-Input)

*User-Input*（用户输入）节点向玩家提示问题并将收到的答案设置为[变量](../getting-started/variables-logic)。

它们向玩家显示的输入（控件）可以自定义，取决于其目标 `variable` 类型（即数字、字符串、布尔值）。这些 `custom`（自定义）设置包括用于外观和输入验证的参数。

+ **数字 (Number)**：
    + *Min 和 Max（最小和最大）*：*包含*的上下限。
    + *Step（步长）*：距最小限制的输入距离应为此值的因数。
    + *Value（值）*：输入（控件）的默认和/或预设值。
+ **字符串 (String)**：
    + *Pattern（模式）*：有效输入应匹配的正则表达式。
        > 空白模式通过任何值（不推荐）。
        > 查看[使用](#使用)部分获取更多信息。
    + *Default（默认）*：输入（控件）的默认和/或预设值。
    + *Extra（额外）*：信息、提示/工具提示、占位符等，取决于运行时实现。
+ **布尔值 (Boolean)**：
    + *False 和 True（假和真）*：负面和正面消息或选项文本，用于自定义输入外观。
    + *Preset State（预设状态）*：输入（控件）的默认和/或预设值。

### 约定

+ 被跳过的 User-Input 节点不显示任何内容，并播放其唯一的出站槽向前，而不对其目标变量的当前值应用任何更改。

+ 除非被跳过，User-Input 始终等待用户交互。

+ 玩家无法通过 User-Input 节点，除非他们的输入是有效的。
    > 如果由于技术限制或设计决策，运行时应该在用户交互后无论如何播放，即使输入无效，也可能强制使用默认值。对于数字输入，也可以使用最接近错误输入的有效值。

+ 提示（问题）文本预期支持最小的 *BBCode* 样式。

+ User-Input 提示（问题）文本支持[变量](../getting-started/variables-logic)和[角色](../getting-started/characters)标签暴露。

### 使用

当我们打算*直接*从玩家接收输入时，需要 User-Input 节点。

> 我们可以使用其他节点类型，如 [Interaction](./interaction) 配合 [Variable-Update](./variable-update)，让玩家在不同选项之间选择（间接地）。

直接输入应始终正确验证。

想象您想让玩家使用字符串（文本）输入选择他们的头像名称/别名。  
您创建一个 User-Input，选择 `hero_alias` 作为目标[变量](../getting-started/variables-logic)，稍后在文本节点中使用它：  
""我的名字是 \{hero_alias\}。准备好打碎你这个蛋怪！""  
如果您不添加*模式*，任何值都会通过。在这种情况下，玩家可以留空输入并通过。  
我们得到的将是"我的名字是 。准备好..."，这不太理想。  
验证始终至关重要。在这种情况下，您可以使用许多模式进行自定义输入，包括但不限于：
+ `^[a-zA-Z]{3,7}$`：接受任何长度为 3 到 7 个字符（包含）的英文字母值
+ `^[\w]{1,}$`：接受至少一个字符的字母数字和下划线（即正则表达式意义上的*单词*）

可能性几乎是无限的。

我们还可以获取 `hero_age` 的数字输入或 `hero_is_on_egg_diet` 的布尔输入，并使用 [Condition](./condition) 节点将玩家导航到不同的分支，例如逃离蛋味，或尝试打碎并烹饪那个巨大的蛋！

尽情发挥您的创造力。让我们使用带有模式验证的输入来制作谜题。在一个场景中，我们的英雄只有知道秘密的蛋词才能进入臭蛋地牢。这个词以谜语的方式写在大臭门上。我们可以提供以下模式来接受有效答案并让我们的英雄通过：
+ `(?i)^eggshell|egg(\W)timer|easter(\W)egg$`：一组可接受的蛋词
    > 使用 `(?i)` 修饰符接受不区分大小写的输入，
    > 使用 `(\W)` 表示某些答案中的非单词（空格、破折号等）。
    >> 我们可以使用 `(\W?)` 使其可选。括号用于分组部分。
+ `(?i)^(egg)(\W?)(nog|roll|cream)$`：用于蛋基食物
+ `(?i)^((egg)(\W?)(plant|fruit))|canistel$`：两种方法的混合

> 字符串 User-Input 支持正则表达式（RegEx 或 RegExp）进行模式验证。  
> 它们非常常见，您可以找到许多关于其[概念][regexp-concept]和语法的资源，或创建和[测试][regexp-test]它们的工具。
>
>> 技术说明：  
>> Arrow 基于 Godot 工作，其正则表达式实现基于 [PCRE2][regexp-pcre2] 库。  
>> 您可以在其手册上找到更多关于 PCRE2 [语法][regexp-pcre2-syntax]和[模式][regexp-pcre2-pat-ref]的信息。

### 另请参阅

+ [变量更新 (Variable-Update)](./variable-update)
    > 根据另一个变量或静态值操作变量。
+ [生成器 (Generator)](./generator)
    > 为变量设置随机或半随机值。
+ [条件 (Condition)](./condition)
    > 创建二元门控，比较变量和值。

<!-- 绝对链接 -->
[regexp-concept]: https://en.wikipedia.org/wiki/Regular_expression
[regexp-test]: https://regexr.com/
[regexp-pcre2]: https://www.pcre.org
[regexp-pcre2-syntax]: https://www.pcre.org/current/doc/html/pcre2syntax.html
[regexp-pcre2-pat-ref]: https://www.pcre.org/current/doc/html/pcre2pattern.html
