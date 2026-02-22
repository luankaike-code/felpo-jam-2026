class_name DropperStand extends Stand

var dropper: Dropper

func setup(dropper_: Dropper) -> void:
	dropper = dropper_

func place_item(item: Node2D) -> bool:
	var cond = item == dropper
	if cond:
		item.global_position = global_position
	return cond
