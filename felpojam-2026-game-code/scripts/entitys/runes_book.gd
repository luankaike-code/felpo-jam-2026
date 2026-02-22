class_name RunesBook extends Draggable

var packed_runes_book_content := preload("res://scenes/pop_ups/pop_up_runes_book_content.tscn") as PackedScene

signal open(pop_up_scene)

@warning_ignore("unused_parameter")
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			open.emit(packed_runes_book_content.instantiate())
