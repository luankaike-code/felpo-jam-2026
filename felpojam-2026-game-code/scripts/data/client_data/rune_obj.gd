class_name RuneObj extends Resource

var rune: RunesData.names
var level: int

func _init(rune_: RunesData.names, level_: int) -> void:
	rune = rune_
	level = level_
