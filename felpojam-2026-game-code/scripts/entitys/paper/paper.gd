class_name Paper extends Draggable

@onready var runes_spots := $Spots as RunesSpots

func add_rune(rune_scene: Rune, global_position: Vector2) -> void:
	rune_scene.position = to_local(global_position)
	add_child(rune_scene)
	runes_spots.add_spot(rune_scene.rune_name, rune_scene.position)
	$AnimationPlayer.play("teste")
