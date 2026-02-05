---
sidebar_position: 2
---

# 命令行参数

Arrow 可执行文件接受以下命令行参数：

## --manual

显示与本文档类似的简要手册。

## --config-dir

Arrow 将用户偏好保存在名为 `.arrow.config` 的文件中。该文件会自动生成，并在 `res://` 或 `user://` 目录中查找，具体取决于文件访问权限等几个因素。

此参数可以更改 Arrow 优先保存或加载配置文件的位置，例如：

```shell
$ Arrow --config-dir '/home/USER/.config/'
```

> 绝对路径和 Godot 相对路径（以 `res://` 或 `user://` 开头）都是有效且支持的。

如果配置文件不存在，Arrow 会创建一个默认配置文件，但不会创建目录。如果找不到或无法创建配置文件，Arrow 将使用默认（硬编码）配置。

> **注意！**  
> Arrow 配置文件的格式和名称在不同主要版本中有所变化。
> 尝试重复使用由旧版本创建的配置文件
> （例如，将 v2.x 的 `config.arrow` 重命名为 v3.x 的 `.arrow.config`）
> *会导致意外行为*。

## --sandbox

编辑器在沙盒模式下使用默认配置运行，并且不会自动生成 `.arrow.config` 文件。

## --work-dir

Arrow 的惯例是将每个工作目录视为一个项目，分成多个 `.arrow` 章节文档。换句话说，Arrow 编辑器一次只使用一个特定目录来保存和重新加载 `.arrow` 文件。默认目录是 `user://`；但可以从首选项面板或使用此参数更改。

```shell
$ Arrow --work-dir '/home/USER/my_arrow_adventures'
```

> 绝对路径和 Godot 相对路径（以 `res://` 或 `user://` 开头）都是有效的。

> 如果目录不存在，Arrow 不会创建它。
