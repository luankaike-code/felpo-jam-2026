class_name Paper extends Draggable

var runes: Array[Rune]

func add_rune(rune_scene: Rune, global_position: Vector2) -> void:
	if runes.size() >= 2:
		return
		
	rune_scene.position = to_local(global_position)
	add_child(rune_scene)
	runes.push_front(rune_scene)
