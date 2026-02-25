extends PopUp

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()
