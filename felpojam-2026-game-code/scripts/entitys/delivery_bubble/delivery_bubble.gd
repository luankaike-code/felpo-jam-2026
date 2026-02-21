class_name DeliveryBubble extends Node2D

var packed_delivery_zone := preload("res://scenes/entitys/delivery_bubble/delivery_zone.tscn") as PackedScene
@onready var bubble := $Bubble as NinePatchRect

signal all_fields_filled()

var delivery_zones: Array[DeliveryZone]
var delivery_zone_gap := 1

func _ready() -> void:
	scale = Vector2.ZERO

func close():
	if scale == Vector2.ZERO:
		return
	remove_delivery_zones()
	
	fix_all_papers()
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, 0.2)

func open():
	if scale == Vector2.ONE:
		return
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, 0.2)

func add_delivery_zone():
	var delivery_zone := packed_delivery_zone.instantiate() as DeliveryZone
	delivery_zone.receive_paper.connect(_all_fields_was_filled)
	
	add_child(delivery_zone)
	
	var dz_size := delivery_zone.get_sprite_size()
	var pos := (dz_size.x + delivery_zone_gap) * delivery_zones.size()
	delivery_zone.position.x = pos + dz_size.x/2
	delivery_zones.push_back(delivery_zone)
	
	_resize_bubble(dz_size)

func _all_fields_was_filled():
	var fields_content = get_fields_content()
	if fields_content:
		all_fields_filled.emit()

func _resize_bubble(dz_size: Vector2):
	bubble.size.x = ((dz_size.x + delivery_zone_gap) * delivery_zones.size())
	bubble.size.y = dz_size.y if dz_size.y > bubble.size.y else bubble.size.y
	bubble.position.y = bubble.size.y / -2

func get_fields_content() -> Array[ParchmentObj]:
	var parchments: Array[ParchmentObj]
	for dz in delivery_zones:
		var parchment := dz.get_parchment()
		
		if !parchment:	return []
		parchments.push_back(parchment)
		
	return parchments

func fix_all_papers():
	for dz in delivery_zones:
		dz.fix_paper()

func remove_delivery_zones():
	for dz in delivery_zones:
		dz.remove()
		
	delivery_zones = []
	_resize_bubble(Vector2.ZERO)
	
	
	
