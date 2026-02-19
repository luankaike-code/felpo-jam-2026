class_name Paper extends Draggable

func add_rune(rune_scene: Rune, global_position: Vector2) -> void:
	rune_scene.position = to_local(global_position)
	add_child(rune_scene)
