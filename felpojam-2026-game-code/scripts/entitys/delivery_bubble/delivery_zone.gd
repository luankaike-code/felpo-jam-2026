class_name DeliveryZone extends Stand

@onready var sprite: Sprite2D = $Sprite

var current_paper: Paper

signal receive_paper

func place_item(item: Node2D) -> bool:
	if item is Paper && !current_paper:
		item.global_position = global_position
		item.start_drag.connect(_on_start_drag)
		current_paper = item
		receive_paper.emit()
		return true
	return false

func remove():
	if current_paper:
		current_paper.queue_free()
	queue_free()

func fix_paper():
	current_paper.is_draggable = false

func _on_start_drag():
	current_paper.start_drag.disconnect(_on_start_drag)
	current_paper = null

func get_sprite_size() -> Vector2:
	return sprite.get_rect().size * sprite.scale

func get_parchment() -> ParchmentObj:
	if current_paper:
		return current_paper.data
	return
