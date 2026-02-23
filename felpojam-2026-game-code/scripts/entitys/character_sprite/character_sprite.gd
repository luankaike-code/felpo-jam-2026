class_name CharacterSprite extends Node2D

@onready var bubble_pos: Node2D = $BubblePos

signal entered
signal exited

func _ready() -> void:
	modulate = Color(0.0, 0.0, 0.0, 0.0)

func enter() -> void:
	var tween := get_tree().create_tween()
	
	tween.tween_property(self, "modulate", Color.WHITE, 1).set_ease(Tween.EASE_IN)
	tween.tween_callback(entered.emit)

func get_bubble_position() -> Vector2:
	return bubble_pos.global_position

func exit():
	var tween := get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(0, 0, 0, 0), 1).set_ease(Tween.EASE_IN)
	tween.tween_callback(exited.emit)
