class_name GameHud extends Node2D

enum arrows {
	left,
	right
}

@onready var dick_bubble: SpeechBubble = $HBoxContainer2/DickBubble
@onready var clock: TextureRect = $HBoxContainer2/Clock
@onready var arrow_left: ClickableTexture = $HBoxContainer/ArrowLeft
@onready var arrow_right: ClickableTexture = $HBoxContainer/ArrowRight

signal arrow_pressed(arrow: arrows)

func _ready() -> void:
	set_process_input(false)
	arrow_left.button_up.connect(func(): arrow_pressed.emit(arrows.left))
	arrow_right.button_up.connect(func(): arrow_pressed.emit(arrows.right))

func set_arrow_enabled(arrow: arrows, value: bool):
	var arrow_node := arrow_left if arrow == arrows.left else arrow_right
	arrow_node.enabled = value
	arrow_node.modulate = Color(1.0, 1.0, 1.0, 1.0 if value else 0.4)
