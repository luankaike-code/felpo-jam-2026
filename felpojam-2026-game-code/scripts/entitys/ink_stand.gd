class_name InkStand extends Stand

var current_item: Stamp

func _ready() -> void:
	super()
	
	description = DescriptionsData.descriptions[DescriptionsData.names.stand_ink]
	
	area_exited.connect(on_area_exited)

func place_item(item: Node2D) -> bool:
	var cond := is_item_available(item)
	
	if cond:
		item.has_ink = true
		item.global_position = global_position
		current_item = item
		
	return cond

func is_item_available(item: Node2D) -> bool:
	return item is Stamp && (!current_item || current_item == item)

func on_area_exited(area: Area2D) -> void:
	if current_item == area:
		current_item = null
