# 国际化 (Internationalization)

Arrow 的国际化 (I18n) 实现分为两个主要部分：**编辑器界面的本地化** 和 **用户项目内容的本地化**。

本文将详细介绍这两部分的实现原理，以及如何为 Arrow 添加新的语言支持或创建支持多语言的自定义节点。

## 1. 编辑器界面本地化

Arrow 使用 Godot 引擎内置的 `TranslationServer` 来处理编辑器的多语言支持。

### 全局翻译文件
编辑器的主要翻译文件位于 `res://assets/translations/` 目录下。这些通常是 `.po` (Gettext Portable Object) 格式的文件。

- `en.po`: 英文模板（通常作为源语言）。
- `zh_CN.po`: 简体中文翻译。
- `fa.po`: 波斯语翻译。

`scripts/editor/panels/preferences.gd` 脚本负责在启动时或更改设置时加载这些文件：

```gdscript
# scripts/editor/panels/preferences.gd

func refresh_language_options() -> void:
    # ...
    var translations_dir = Helpers.Utils.normalize_dir_path(Settings.UI_TRANSLATIONS_DIR)
    for each_rel_path in DirAccess.get_files_at(translations_dir):
        var translation: Translation = ResourceLoader.load(translations_dir + each_rel_path, "Translation", ...)
        TranslationServer.add_translation(translation)
    # ...
```

### 节点特定翻译
Arrow 采用模块化的节点系统。每个节点类型（位于 `res://nodes/<type>/`）都可以有自己的翻译文件，存放在其 `translations/` 子目录中。

`scripts/core/node_types_handler.gd` 负责加载这些分散的翻译资源：

```gdscript
# scripts/core/node_types_handler.gd

func parse_node_type_folder(node_type_dir_name: String):
    # ...
    var the_translations_dir = Helpers.Utils.normalize_dir_path(dir_path + NODE_TYPE_TRANSLATION_FILES_DIR)
    # 遍历并加载该节点类型的所有翻译文件
    for each_rel_path in translation_files:
        var translation: Translation = ResourceLoader.load(...)
        TranslationServer.add_translation(translation)
    # ...
```

这种设计使得自定义节点可以独立分发，并包含自己的本地化资源，而无需修改全局翻译文件。

### 如何添加新的编辑器语言

1.  复制 `res://assets/translations/en.po` 并重命名为你的目标语言代码（例如 `fr.po`）。
2.  使用 PO 编辑器（如 Poedit）或文本编辑器修改 `msgstr` 内容。
3.  Arrow 会自动检测新文件并将其添加到首选项的语言列表中。

对于特定节点，在 `res://nodes/<node_name>/translations/` 下执行相同的操作。

---

## 2. 用户项目内容本地化

Arrow 允许用户导出项目的文本内容（如对话、独白等）为 CSV 格式，以便进行翻译。这是通过 **CSV 导出** 功能实现的。

### CSV 导出原理

导出逻辑位于 `scripts/core/project_management.gd` 中的 `save_project_csv` 和 `recreate_csv_rows` 函数。

1.  **遍历节点**: 系统遍历项目中的所有节点。
2.  **调用 Inspector**: 对于每个节点，系统会实例化其对应的编辑器检查器 (`Inspector`)。
3.  **提取数据**: 调用检查器的 `map_i18n_data` 方法（如果存在）来获取可翻译的数据。

```gdscript
# scripts/core/project_management.gd

# ...
var type_inspector = _MAIN.Mind.NODE_TYPES_LIST[node.type].inspector.instantiate()
var parts_mapping =  type_inspector.map_i18n_data(node_id, node) if type_inspector.has_method("map_i18n_data") else {}
# ...
```

### CSV 格式
导出的 CSV 文件包含以下列：
- `key`: 唯一标识符（通常基于节点 ID 和参数名）。
- `original`: 原始文本（开发语言）。
- `[lang_code]`: 其他语言的列（如果导出的 CSV 是基于现有文件更新的）。

### 为自定义节点支持 I18n 导出

如果你创建了一个自定义节点类型，并希望其内容能被导出到 CSV，你需要在该节点的 `inspector.gd` 脚本中实现 `map_i18n_data` 函数。

**示例 (`nodes/content/inspector.gd`):**

```gdscript
func map_i18n_data(node_id, node_data) -> Dictionary:
    var data = {}
    # 导出标题
    if node_data.has("title") and node_data.title.length() > 0:
        data[String(node_id) + ":title"] = node_data.title
    # 导出内容
    if node_data.has("content") and node_data.content.length() > 0:
        data[String(node_id) + ":content"] = node_data.content
    return data
```

这个函数应返回一个字典，其中：
- **Key**: 导出 CSV 中的键（建议包含 `node_id` 以确保唯一性）。
- **Value**: 需要翻译的原始文本字符串。

---

## 总结

Arrow 的 I18n 架构兼顾了编辑器的扩展性和用户项目的实用性。
- **编辑器**: 使用 Godot 标准流程，支持核心与模块分离的翻译资源。
- **用户项目**: 提供数据驱动的 CSV 导出接口，通过节点检查器动态提取文本，实现了高度的灵活性。
