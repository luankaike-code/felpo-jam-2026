extends Node2D

var packed_stamp := preload("res://scenes/entitys/stamp.tscn") as PackedScene

@onready var sprite_2d: Sprite2D = $Sprite2D

var stamps: Array[RunesData.names] = [
	RunesData.names.fire,
	RunesData.names.water,
	RunesData.names.air,
	RunesData.names.earth,
	RunesData.names.dark,
	RunesData.names.light
]

func _ready() -> void:
	var stand_size := sprite_2d.texture.get_size()
	var space := (stand_size.x/stamps.size())
	var start_x = stand_size.x/-2 + 39
	
	for i in range(stamps.size()):
		var stamp_scene := packed_stamp.instantiate() as Stamp
		stamp_scene.rune_name = stamps[i]
		stamp_scene.position.x = (start_x + space * i) - i
		stamp_scene.spawn_node.connect(add_child)
		add_child(stamp_scene)
