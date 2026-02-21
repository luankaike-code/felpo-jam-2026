class_name StandCharacterSprite extends Stand

signal receives_parchments(parchments: Array[ParchmentObj])

var is_actived = false
var parchments: Array[ParchmentObj]

func place_item(item: Node2D) -> bool:
	if item is Paper && item.runes.size() > 0 && is_actived:
		parchments.push_back(item.data)
		receives_parchments.emit(parchments)
		
		item.is_draggable = false
		var tween := get_tree().create_tween()
		tween.tween_property(item, "scale", Vector2.ZERO, 0.2)
		tween.tween_callback(item.queue_free)
		return true
	return false
