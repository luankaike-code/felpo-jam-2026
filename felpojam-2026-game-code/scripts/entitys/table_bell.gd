class_name TableBell extends Area2D

var can_emit_sound := true
var enable := true
signal pressed

@warning_ignore("unused_parameter")
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if !event is InputEventMouseButton || event.button_index != MOUSE_BUTTON_LEFT:
		return
	
	if can_emit_sound:
		can_emit_sound = false
		Sound.play_sound(SoundData.names.table_bell).finished.connect(func(): can_emit_sound = true)
		if enable:
			pressed.emit()
