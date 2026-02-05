---
sidebar_position: 1
---

# 从源码构建

Arrow 使用免费且开源的 [Godot 引擎](https://godotengine.org/) 开发。

Godot 官方文档有一份关于[如何导出 Godot 项目][godot-export-instruction]的详尽指南，这是一项相当简单直接的任务。

虽然我们只为部分选定的平台支持或发布版本，但 Arrow 通常可以在 Godot 支持的所有桌面平台和架构上正常工作。

> Arrow v3.x（当前版本）基于 Godot v4.x 运行。
> 我们会尽量跟进 Godot 的最新稳定版本，但这并不能保证。
> 为保险起见，您可以使用与我们最新[发布版本][releases]相同的 Godot 引擎版本。

## 滚动发布？！

上面提到的导出项目可能是标准方式，但如果您想利用 Godot 的灵活性、修改编辑器或使用刚出炉的最新功能，还有另一种方式可以体验最前沿的版本！

用于开发 Arrow 的 Godot 游戏引擎有一个非常有趣的特性：如果您将正确版本的 Godot 引擎（编辑器可执行文件）复制到游戏项目（这里是 Arrow）的根目录并运行它，您将获得运行的游戏而不是编辑器，就像使用调试模式导出的一样。

因此，如果您想要最新的功能，无论您是否想要修改 Arrow 的任何部分，直接从克隆的源码运行可以让事情更快：

+ 从 git 仓库获取 Arrow
+ 下载（并解压）正确的 Godot 引擎可执行文件
+ 将可执行文件复制到克隆的 Arrow 项目根目录（`project.godot` 文件所在位置）
+ 可选择重命名 Godot 可执行文件（根据您的操作系统命名为 `Arrow`、`Arrow.exe` 等）
+ 运行可执行文件并享受
+ 您可以 `.gitignore` 该可执行文件和其他即时创建的工件，这样您可以轻松拉取新的提交
+ 随时拉取新提交以更新您的编辑器，当您发现有趣的新功能时

> 虽然我们尽量保持主分支相当稳定（接近 beta 或候选发布版），
> 但永远不能保证不会出问题，
> 所以请采取必要的预防措施，换句话说
> 记得备份您的作品！

## 附加说明

+ Arrow 的硬编码默认设置在 `./scripts/settings.gd` 文件中，如果需要可以修改它们。
  > 一些模块和节点在各自的脚本中有自己的设置作为常量。
  > 一般*不建议*修改这些设置。

+ 官方基于浏览器（HTML-JS）运行时的源码与 Arrow 捆绑在 `./runtimes` 目录中。
模板文件 `html-js.arrow-runtime` 是 Arrow 用来创建可播放导出的文件。
如果该文件被删除，Arrow 编辑器将从其源码重新构建它，
这可以使导出的修改更加容易。

<!-- 参考链接 -->
[godot-export-instruction]: https://docs.godotengine.org/en/stable/tutorials/export/exporting_projects.html
[releases]: https://github.com/mhgolkar/Arrow/releases
