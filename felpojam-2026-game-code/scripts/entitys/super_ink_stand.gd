extends Node2D

@onready var ink_stand: InkStand = $InkStand
@onready var ink_stand_2: InkStand = $InkStand2

func _ready() -> void:
	ink_stand.stamp_placed.connect(update_z_index)
	ink_stand_2.stamp_placed.connect(update_z_index)

func update_z_index():
	if !ink_stand.current_item || !ink_stand_2.current_item:
		return
	
	ink_stand_2.current_item.z_index = ink_stand.current_item.z_index + 1
