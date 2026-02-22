class_name StampStand extends Stand

@export var linked_stamp: Stamp

func place_item(item: Node2D) -> bool:
	if linked_stamp == item:
		item.global_position = global_position
		return true
	return false
