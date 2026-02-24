class_name GameHud extends Control

enum arrows {
	left,
	right
}

@onready var dick_bubble: SpeechBubble = $MarginContainer/Control2/HBoxContainer/DickBubble
@onready var clock: TextureRect = $MarginContainer/Control2/HBoxContainer/Clock
@onready var arrow_left: ClickableTexture = $MarginContainer/Control/HBoxContainer/ArrowLeft
@onready var arrow_right: ClickableTexture = $MarginContainer/Control/HBoxContainer/ArrowRight

signal arrow_pressed(arrow: arrows)

func _ready() -> void:
	arrow_left.button_up.connect(func(): arrow_pressed.emit(arrows.left))
	arrow_right.button_up.connect(func(): arrow_pressed.emit(arrows.right))

func set_arrow_enabled(arrow: arrows, value: bool):
	var arrow_node := arrow_left if arrow == arrows.left else arrow_right
	arrow_node.enabled = value
	arrow_node.modulate = Color(1.0, 1.0, 1.0, 1.0 if value else 0.4)

func move(pos):
	pass

func setup(camera: CameraInGame):
	pass
