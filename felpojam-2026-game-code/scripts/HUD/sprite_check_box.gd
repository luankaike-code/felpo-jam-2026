class_name SpriteCheckBox extends MarginContainer

@onready var texture_rect: TextureRect = $TextureRect

@onready var region_uncheck := Rect2(79.0, 79.0, 16.0, 16.0)
@onready var region_check := Rect2(111.0, 79.0, 16.0, 16.0)

var texture: AtlasTexture
var frame_size: Vector2
var value: bool :
	set(new):
		value = new
		_update_value()

signal changed

func _ready() -> void:
	texture = texture_rect.texture
	frame_size = texture.region.size
	_update_value()

@warning_ignore("unused_parameter")
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			value = !value

func _update_value():
	texture.region = region_check if value else region_uncheck
	changed.emit(value)
