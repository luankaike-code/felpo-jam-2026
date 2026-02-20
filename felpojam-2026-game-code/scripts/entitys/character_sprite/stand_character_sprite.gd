class_name StandCharacterSprite extends Stand

signal receive_runes

var is_actived = false
var runes: Array[Rune]
		

func place_item(item: Node2D) -> bool:
	if item is Paper && item.runes.size() > 0 && is_actived:
		runes = item.runes
		receive_runes.emit()
		item.queue_free()
		return true
	return false
