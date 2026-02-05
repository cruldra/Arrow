<img src="./icon.svg" style="width: 64px; height: auto; display: block; margin-bottom: 1rem;" alt="">

Arrow
=====

***游戏叙事设计工具***

[下载](#download) | [集成](#runtime--integration) | [Web 应用](#web-app) | [指南](#guides)

Arrow 是一款免费、开源且功能丰富的工具，用于*游戏叙事*设计、*文字冒险*开发以及*交互式非线性叙事*文档的创建。

![Arrow 的整体外观][arrow-screenshot]

显著特性：

+ Free as in Freedom（自由免费）
+ 100% 可视化开发
+ 高级节点系统
+ 友好的版本控制系统（VCS）存档文件
+ 支持分布式工作流
+ 一键导出可玩版本 (HTML)
+ CSV (国际化/I18n) 导出
+ Unicode 支持（包括 RTL、CJK 和 CTL）
+ 连续性安全 (Continuum Safety)

Arrow 支持丰富的功能，从场景和宏，到变量和角色。
它还带有内置的通用节点类型，提供逻辑、交互式导航、随机数据生成、状态管理等功能。

> 查看 [指南](#guides) 获取详细信息。


## Download (下载)

Arrow 预构建的可执行文件可从 [发布][releases] 归档中下载。

以下链接指向*相当稳定的最新*版本：

+ Linux (X11) [x86_64 (64-bit)][linux-x11-x86-64-latest]
+ Windows [64-bit][win-64-latest]

> 对于其他平台和架构，或者想要利用主分支中的最新功能，
> 请考虑 [从源码构建或运行 Arrow][wiki-build-from-source]。


## Web App (Web 应用)

Arrow 也可以作为 [渐进式 Web 应用 (PWA)][web-app] 使用。

该应用尽力提供与最新下载版本相当的核心功能。  
最关键的区别在于***它将项目数据和配置存储在您的浏览器中***。  
提供了额外的导入和导出便利功能，以简化与您设备文件系统的交互。

> **注意！**  
> 由于浏览器的特性，**某些功能在 Web 应用版本中可能会受限或不可用**。  
> 我们*强烈建议尽可能优先使用桌面版 (OS 平台) Arrow*。  
> 目前已知在浏览器上受限的功能包括：
> 从用户系统加载字体（影响 Unicode 支持）、窗口管理便利功能和增量导出。

> PWA 版本需要您的浏览器支持 `WebGl` 和 `Canvas` 元素，
> 可用 `Web-Storage`，并启用 `Java-Script`（任何*现代浏览器*默认都支持）。

> 体验针对中大型屏幕进行了优化。


## Runtime & Integration (运行时与集成)

+ [Bow]
    > Bow 核心内置了完整的 Arrow 运行时，以及更多功能，它是我们作为一个最小化/演示用开源游戏开发的叙事软件开发工具包 (SDK)。

+ [官方 HTML-JS 运行时][runtime-html-js]
    > 随 Arrow 捆绑，此运行时用于可玩导出。


## Guides (指南)

Arrow 的文档可在 [仓库的 Wiki][wiki-home] 中找到，
包括 [快速入门指南][wiki-quick-start-guide] 以及详细说明、内置节点文档等。


## Licenses (许可)

Copyright (c) 2021-present Mor. H. Golkar and contributors

除非另有说明，本仓库中的 Arrow 和文件均根据 `MIT` 许可证提供。
查看 [license][license-file] & [copyright][copyright-file] 文件以获取更多信息。


祝您使用愉快



<!-- Download -->
[releases]: https://github.com/mhgolkar/Arrow/releases
[linux-x11-x86-64-latest]: https://github.com/mhgolkar/Arrow/releases/download/v3.1.0/Arrow-v3.1.0-linux-x86_64.tar.gz
[win-64-latest]: https://github.com/mhgolkar/Arrow/releases/download/v3.1.0/Arrow-v3.1.0-win.64.zip
<!-- PWA -->
[web-app]: https://mhgolkar.github.io/Arrow/
<!-- Wiki -->
[wiki-home]: https://github.com/mhgolkar/Arrow/wiki/
[wiki-build-from-source]: https://github.com/mhgolkar/Arrow/wiki/build-from-source
[wiki-quick-start-guide]: https://github.com/mhgolkar/Arrow/wiki/quick-start-guide
<!-- Relative -->
[runtime-html-js]: ./runtimes/html-js/
[license-file]: ./license
[copyright-file]: ./copyright
<!-- Resources -->
[arrow-screenshot]: https://mhgolkar.github.io/Arrow/media/overview.v3.png
<!-- External -->
[Bow]: https://github.com/mhgolkar/Bow
