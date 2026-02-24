class_name ClickableTexture extends TextureRect

signal button_up

var _is_button_down := false
var enabled := true

func _gui_input(event: InputEvent) -> void:
	if !event is InputEventMouseButton || !enabled:
		return
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	
	if !_is_button_down && event.is_pressed():
		_is_button_down = true
	elif _is_button_down && !event.is_pressed():
		_is_button_down = false
		button_up.emit()
