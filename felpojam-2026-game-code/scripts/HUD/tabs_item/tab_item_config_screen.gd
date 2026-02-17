extends TabBar

@onready var resolution_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/ScreenResolution/Resolutions as OptionButton
@onready var screen_mode_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/SreenMode/ScreenModes as OptionButton

var resolutions: Dictionary[String, Vector2i] = {
	"3840X2160(16:9)": Vector2i(3840, 2160),
	"1920X1080(16:9)": Vector2i(1920, 1080),
	"1440X900(16:10)": Vector2i(1440, 900),
	"1290X720(16:9)": Vector2i(1290, 720),
	"648X648(1:1)": Vector2i(648, 648),
}

var screen_modes: Dictionary[String, Window.Mode] = {
	"tela cheia": Window.MODE_FULLSCREEN,
	"janela": Window.MODE_WINDOWED,
}

var current_resolution: int

func _ready() -> void:
	resolution_drop_menu.item_selected.connect(resolution_selected)
	screen_mode_drop_menu.item_selected.connect(screen_mode_selected)
	
	populate_drop_menu_with_dict(resolution_drop_menu, resolutions)
	populate_drop_menu_with_dict(screen_mode_drop_menu, screen_modes)


func populate_drop_menu_with_dict(drop_menu: OptionButton, dict: Dictionary) -> void:
	for key in dict.keys():
		drop_menu.add_item(key)

func populate_drop_menus() -> void:
	for resolution in resolutions.keys():
		resolution_drop_menu.add_item(resolution)
	for resolution in resolutions.keys():
		resolution_drop_menu.add_item(resolution)

func resolution_selected(resolution_index: int) -> void:
	current_resolution = resolution_index
	var resolution_key: String = resolutions.keys()[resolution_index]
	var resolution := resolutions[resolution_key]

	var window := get_window()
	window.size = resolution
	window.content_scale_size = resolution

func screen_mode_selected(screen_mode_index: int) -> void:
	var screen_mode_key: String = screen_modes.keys()[screen_mode_index]
	var screen_mode := screen_modes[screen_mode_key]
	
	var window := get_window()
	window.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
	window.mode = screen_mode
	
	resolution_selected(current_resolution)
	
	
	
	
