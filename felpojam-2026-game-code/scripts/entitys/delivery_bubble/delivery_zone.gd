class_name DeliveryZone extends Stand

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var current_paper: Paper

signal filled

func resize(size: Vector2):
	collision_shape_2d.shape.size = size

func place_item(item: Node2D) -> bool:
	if item is Paper && !current_paper:
		if !item.data.content:
			return false
		item.global_position = global_position
		item.start_drag.connect(_on_start_drag)
		current_paper = item
		filled.emit()
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

func get_parchment() -> ParchmentObj:
	if current_paper:
		return current_paper.data
	return

func destroy_current_paper() -> void:
	if current_paper:
		current_paper.queue_free()
