class_name InkStand extends Stand

var current_item: Stamp

func _ready() -> void:
	area_exited.connect(on_area_exited)

func place_item(item: Node2D) -> bool:
	if item is Stamp && (!current_item || current_item == item):
		item.has_ink = true
		item.global_position = global_position
		current_item = item
		Sound.play_sound(SoundData.names.stamp_ink)
		return true
	return false

func on_area_exited(area: Area2D):
	if current_item == area:
		current_item = null
