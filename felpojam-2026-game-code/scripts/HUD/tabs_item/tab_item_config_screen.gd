extends TabBar

@onready var resolution_drop_menu := $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/ScreenResolution/Resolutions as OptionButton

var resolutions: Dictionary[String, Vector2i] = {
	"1920X1080": Vector2i(1920, 1080),
	"1440X900": Vector2i(1440, 900),
	"400X200": Vector2i(400, 200),
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
	print(resolution, resolution_index, resolution_drop_menu.get_item_text(resolution_index))
	DisplayServer.window_set_size(resolution)
