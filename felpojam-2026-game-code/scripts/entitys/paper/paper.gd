class_name Paper extends Draggable

var runes: Array[Rune]

var data: ParchmentObj :
	get():
		var rune_objs: Array[RuneObj]
		for rune in runes:
			rune_objs.push_back(rune.data)
		return ParchmentObj.new(rune_objs)

func add_rune(rune_scene: Rune, rune_global_position: Vector2) -> void:
	if runes.size() >= 2:
		return
		
	rune_scene.position = to_local(rune_global_position)
	add_child(rune_scene)
	runes.push_front(rune_scene)
