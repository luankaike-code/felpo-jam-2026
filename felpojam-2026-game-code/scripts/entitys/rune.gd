class_name Rune extends Area2D

@export var rune_name: RunesData.names 

func _ready() -> void:
	rotation_degrees = randf_range(-45, 45)
