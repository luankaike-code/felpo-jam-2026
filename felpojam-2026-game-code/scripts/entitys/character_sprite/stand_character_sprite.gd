class_name StandCharacterSprite extends Stand

signal receives_parchments

var is_actived = false
var parchments: Array[Paper]

func place_item(item: Node2D) -> bool:
	if item is Paper && item.runes.size() > 0 && is_actived:
		parchments.push_front(item)
		receives_parchments.emit(parchments)
		item.queue_free()
		return true
	return false
