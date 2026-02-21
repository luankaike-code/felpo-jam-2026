class_name DeliveryBubble extends Node2D

var packed_delivery_zone := preload("res://scenes/entitys/delivery_bubble/delivery_zone.tscn") as PackedScene
@onready var bubble := $Bubble as NinePatchRect

var delivery_zones: Array[DeliveryZone]
var delivery_zone_gap := 1

func add_delivery_zone():
	var delivery_zone := packed_delivery_zone.instantiate() as DeliveryZone
	
	add_child(delivery_zone)
	
	var dz_size := delivery_zone.get_sprite_size()
	var pos := (dz_size.x + delivery_zone_gap) * delivery_zones.size()
	delivery_zone.position.x = pos + dz_size.x/2
	delivery_zones.push_back(delivery_zone)
	
	resize_bubble(dz_size)

func resize_bubble(dz_size: Vector2):
	bubble.size.x = ((dz_size.x + delivery_zone_gap) * delivery_zones.size())
	bubble.size.y = dz_size.y if dz_size.y > bubble.size.y else bubble.size.y
	bubble.position.y = bubble.size.y / -2

func get_fields_content() -> Array[ParchmentObj]:
	var parchments: Array
	for dz in delivery_zones:
		var parchment := dz.get_parchment()
		
		if !parchment:	return []
		parchments.push_back(parchment)
		
	return parchments

func remove_delivery_zones():
	for dz in delivery_zones:
		dz.queue_free()
		
	delivery_zones = []
	resize_bubble(Vector2.ZERO)
	
	
	
