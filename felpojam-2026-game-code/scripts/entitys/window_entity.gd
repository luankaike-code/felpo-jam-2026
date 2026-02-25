class_name WindowEntity extends Node2D

@onready var bg: Sprite2D = $Sprite2D3/Sprite2D

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	bg.rotation_degrees = (360.0/24)*GlobalTime.total_hours
