class_name Stand extends ObjWithDescription

@warning_ignore("unused_parameter")
func place_item(item: Node2D) -> bool:
	return false

func is_item_available(item: Node2D) -> bool:
	return !!item
