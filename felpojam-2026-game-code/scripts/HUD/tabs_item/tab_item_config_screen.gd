extends TabBar

@onready var resolution_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/ScreenResolution/Resolutions as OptionButton
@onready var screen_mode_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/SreenMode/ScreenModes as OptionButton
@onready var v_sync_checkbox := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/SreenMode2/Control/CheckBox as CheckBox

func _ready() -> void:
	populate_drop_menu_with_dict(resolution_drop_menu, WindowData.resolutions)
	populate_drop_menu_with_dict(screen_mode_drop_menu, WindowData.screen_modes)
	
	set_current_values()
	
	connected_signals()
	
func populate_drop_menu_with_dict(drop_menu: OptionButton, dict: Dictionary) -> void:
	for key in dict.keys():
		drop_menu.add_item(key)

func set_current_values():
	v_sync_checkbox.button_pressed = HelperWindow.get_v_sync()
	
	var resolution_index = Helpers.get_dict_index_with_value(WindowData.resolutions, get_window().content_scale_size)
	resolution_drop_menu.select(resolution_index)
	
	var screen_mode_index = Helpers.get_dict_index_with_value(WindowData.screen_modes, get_window().mode)
	screen_mode_drop_menu.select(screen_mode_index)

func connected_signals() -> void:
	resolution_drop_menu.item_selected.connect(resolution_selected)
	screen_mode_drop_menu.item_selected.connect(screen_mode_selected)

	v_sync_checkbox.toggled.connect(HelperWindow.set_v_sync)

func resolution_selected(resolution_index: int) -> void:
	var resolution: Vector2i = WindowData.resolutions.values()[resolution_index]
	
	HelperWindow.set_resolution(resolution)

func screen_mode_selected(screen_mode_index: int) -> void:
	var screen_mode: Window.Mode = WindowData.screen_modes.values()[screen_mode_index]
	
	HelperWindow.set_window_mode(screen_mode)
	HelperWindow.set_resolution(Global.current_resolution)
