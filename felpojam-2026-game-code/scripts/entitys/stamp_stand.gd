class_name StampStand extends Stand

@export var linked_stamp: Stamp

func setup(stamp: Stamp):
	linked_stamp = stamp

func place_item(item: Node2D) -> bool:
	if linked_stamp == item:
		item.global_position = global_position
		return true
	return false
