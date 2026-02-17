extends Stand

func place_item(item: Node2D) -> bool:
	if item is Paper:
		item.queue_free()
		return true
	return false
