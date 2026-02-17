class_name InkStand extends Stand

func place_item(item: Node2D) -> bool:
	if item is Stamp:
		item.has_ink = true
		item.global_position = global_position
		return true
	return false
