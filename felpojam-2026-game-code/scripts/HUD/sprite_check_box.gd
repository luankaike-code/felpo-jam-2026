class_name SpriteCheckBox extends MarginContainer

@onready var texture_rect: TextureRect = $TextureRect

var texture: AtlasTexture
var frame_size: Vector2
var value: bool :
	set(new):
		value = new
		print(self, value)
		_update_value()

signal changed

func _ready() -> void:
	texture = texture_rect.texture
	frame_size = texture.region.size

@warning_ignore("unused_parameter")
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			value = !value

func _update_value():
	var pos_x := frame_size.x if value else 0.0
	texture.region.position.x = pos_x
	changed.emit(value)
