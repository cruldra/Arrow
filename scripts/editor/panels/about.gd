# Arrow
# Game Narrative Design Tool
# Mor. H. Golkar

# About Panel
extends Control

@onready var Main = get_tree().get_root().get_child(0)

@onready var CloseButton = $/root/Main/Overlays/Control/About/Margin/Half/Right/Toolbar/Close
@onready var AppVersionDisplay = $/root/Main/Overlays/Control/About/Margin/Half/Left/Information/Version
@onready var Copyright = $/root/Main/Overlays/Control/About/Margin/Half/Right/Tabs/Copyright

@onready var HelloLabel = $/root/Main/Overlays/Control/About/Margin/Half/Right/Tabs/Hello
@onready var WebsiteBtn = $/root/Main/Overlays/Control/About/Margin/Half/Left/Information/Website
@onready var RepoBtn = $/root/Main/Overlays/Control/About/Margin/Half/Left/Information/Repository
@onready var DocsBtn = $/root/Main/Overlays/Control/About/Margin/Half/Left/Information/Documentation
@onready var TabsContainer = $/root/Main/Overlays/Control/About/Margin/Half/Right/Tabs

const LINKS: Array[Variant] = [
	["/root/Main/Overlays/Control/About/Margin/Half/Left/Information/Website", "https://mhgolkar.github.io/Arrow/"],
	["/root/Main/Overlays/Control/About/Margin/Half/Left/Information/Repository", "https://github.com/mhgolkar/Arrow"],
	["/root/Main/Overlays/Control/About/Margin/Half/Left/Information/Documentation", "https://github.com/mhgolkar/Arrow/wiki"],
]

const LICENSE = "res://license"
const COPYRIGHT = "res://copyright"
const COPYRIGHT_PLUS = ["res://assets/fonts/copyright"]

func _ready() -> void:
	AppVersionDisplay.set_text( Settings.ARROW_VERSION );
	register_connections()
	print_copyright()
	refresh_translations()
	pass

func refresh_translations() -> void:
	HelloLabel.set_text(tr("WELCOME_MESSAGE"))
	WebsiteBtn.set_text(tr("Website"))
	RepoBtn.set_text(tr("Repository"))
	DocsBtn.set_text(tr("Documentation"))
	CloseButton.set_text(tr("Close"))
	TabsContainer.set_tab_title(0, tr("Hello"))
	TabsContainer.set_tab_title(1, tr("Copyright"))
	pass

func register_connections() -> void:
	CloseButton.pressed.connect(self._toggle, CONNECT_DEFERRED)
	# Link Buttons
	for link in LINKS:
		# var link_button = get_node(link[0])
		# link_button.pressed.connect(OS.shell_open.bind(link[1]), CONNECT_DEFERRED)
		get_node(link[0]).set_uri(link[1])
	self.visibility_changed.connect(self._on_visibility_changed)
	pass

func _on_visibility_changed() -> void:
	if self.visible:
		refresh_translations()
	pass

func _toggle() -> void:
	Main.call_deferred("toggle_about")
	pass

func print_copyright() -> void:
	var copyright: String = Helpers.Utils.read_text_extended(COPYRIGHT, "#")
	# ...
	copyright = copyright.replacen("@Import:ARROW_LICENSE", Helpers.Utils.read_text_file(LICENSE))
	# ...
	copyright = copyright.replacen("@Import:GODOT_LICENSE_FROM_ENGINE", Engine.get_license_text())
	# ...
	var all_godot_components := Engine.get_copyright_info()
	var all_godot_components_text := ""
	for dict in all_godot_components:
		for parts in dict.parts:
			all_godot_components_text += "\n• %s (%s): %s \n\t Godot source files concerned: %s \n" % [dict.name, parts.license, ", ".join(parts.copyright), ", ".join(parts.files)]
	copyright = copyright.replacen("@Import:GODOT_THIRD_PARTY_COMPONENTS_FROM_ENGINE", all_godot_components_text)
	# ...
	var all_godot_licenses := Engine.get_license_info()
	var all_godot_licenses_text := ""
	for license_name in all_godot_licenses:
		all_godot_licenses_text += "\n• License: %s \n\n%s\n" % [license_name, all_godot_licenses[license_name]]
	copyright = copyright.replacen("@Import:GODOT_LICENSES_TEXT_FROM_ENGINE", all_godot_licenses_text)
	# ...
	copyright = copyright.replacen("@GODOT_VERSION", Engine.get_version_info().string)
	# ...
	var copyright_pluses = String()
	for plus in COPYRIGHT_PLUS:
		copyright_pluses += Helpers.Utils.read_text_extended(plus, "#") + "\n"
	copyright = copyright.replacen("@Import:COPYRIGHT_PLUS_FILES", copyright_pluses)
	# ...
	Copyright.set_text(copyright)
