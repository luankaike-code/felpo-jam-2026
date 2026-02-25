class_name Trash extends Stand

var enable := true

func place_item(item: Node2D) -> bool:
	if item is Paper && enable:
		item.queue_free()
		return true
	return false
