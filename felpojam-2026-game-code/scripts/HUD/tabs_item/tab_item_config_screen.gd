extends TabBar

@onready var resolution_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/ScreenResolution/Resolutions as OptionButton
@onready var screen_mode_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/SreenMode/ScreenModes as OptionButton

func _ready() -> void:
	resolution_drop_menu.item_selected.connect(resolution_selected)
	screen_mode_drop_menu.item_selected.connect(screen_mode_selected)
	
	populate_drop_menu_with_dict(resolution_drop_menu, WindowData.resolutions)
	populate_drop_menu_with_dict(screen_mode_drop_menu, WindowData.screen_modes)

func populate_drop_menu_with_dict(drop_menu: OptionButton, dict: Dictionary) -> void:
	for key in dict.keys():
		drop_menu.add_item(key)

func resolution_selected(resolution_index: int) -> void:
	var resolution_key: String = WindowData.resolutions.keys()[resolution_index]
	var resolution := WindowData.resolutions[resolution_key]
	Global.current_resolution = resolution
	HelperWindow.set_resolution(resolution)

func screen_mode_selected(screen_mode_index: int) -> void:
	var screen_mode_key: String = WindowData.screen_modes.keys()[screen_mode_index]
	var screen_mode := WindowData.screen_modes[screen_mode_key]
	
	var window := get_window()
	window.mode = screen_mode
	
	HelperWindow.set_resolution(Global.current_resolution)
