extends TabBar

@onready var resolution_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/ScreenResolution/Resolutions as OptionButton

var resolutions: Dictionary[String, Vector2i] = {
	"3840X2160(16:9)": Vector2i(3840, 2160),
	"1920X1080(16:9)": Vector2i(1920, 1080),
	"1440X900(16:10)": Vector2i(1440, 900),
	"1290X720(16:9)": Vector2i(1290, 720),
	"648X648(1:1)": Vector2i(648, 648),
}

func _ready() -> void:
	resolution_drop_menu.item_selected.connect(resolution_selected)
	populate_resolution_drop_menu()
	
func populate_resolution_drop_menu() -> void:
	for resolution in resolutions.keys():
		resolution_drop_menu.add_item(resolution)

func resolution_selected(resolution_index: int) -> void:
	var resolution_key: String = resolutions.keys()[resolution_index]
	var resolution := resolutions[resolution_key]

	get_window().size = resolution
	get_window().content_scale_size = resolution
	#DisplayServer.window_set_size(resolution)
