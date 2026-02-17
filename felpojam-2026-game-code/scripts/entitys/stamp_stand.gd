class_name StampStand extends Stand

func place_item(item: Node2D) -> bool:
	if item is Stamp:
		item.global_position = global_position
		return true
	return false
