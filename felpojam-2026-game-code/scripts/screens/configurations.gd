extends Screen

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		change_screen.emit(ScreenData.names.menu)
