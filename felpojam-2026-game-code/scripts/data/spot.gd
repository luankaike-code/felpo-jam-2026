class_name Spot extends Resource

var pos: Vector2
var color: Color

func _init(rune_name: RunesData.names, pos_: Vector2) -> void:
	pos = pos_
	color = RunesData.colors[rune_name]
