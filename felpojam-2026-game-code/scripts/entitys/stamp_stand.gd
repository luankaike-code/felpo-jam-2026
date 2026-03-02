class_name StampStand extends Stand

@export var linked_stamp: StampBase

func setup(stamp: StampBase):
	linked_stamp = stamp

func place_item(item: Node2D) -> bool:
	var cond := is_item_available(item)
	
	if linked_stamp == item:
		item.global_position = global_position
		
	return cond

func is_item_available(item: Node2D) -> bool:
	return linked_stamp == item
