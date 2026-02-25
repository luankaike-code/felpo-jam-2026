class_name GameHud extends Node2D

enum arrows {
	left,
	right
}

@onready var clock_hud: ClockHud = $HBoxContainer2/Control2/ClockHud
@onready var arrow_left: ClickableTexture = $HBoxContainer/ArrowLeft
@onready var arrow_right: ClickableTexture = $HBoxContainer/ArrowRight
@onready var speech_bubble_manager: SpeechBubbleManager = $HBoxContainer2/Control/SpeechBubbleManager

var current_speech_bubble: SpeechBubble

signal arrow_pressed(arrow: arrows)

func _ready() -> void:
	set_process_input(false)
	arrow_left.button_up.connect(func(): arrow_pressed.emit(arrows.left))
	arrow_right.button_up.connect(func(): arrow_pressed.emit(arrows.right))

func set_arrow_enabled(arrow: arrows, value: bool) -> void:
	var arrow_node := arrow_left if arrow == arrows.left else arrow_right
	arrow_node.enabled = value
	arrow_node.modulate = Color(1.0, 1.0, 1.0, 1.0 if value else 0.4)

func add_dick(dick_text: String) -> void:
	remove_current_dick()
	current_speech_bubble = speech_bubble_manager.create_speech_bubble([dick_text])

func remove_current_dick() -> void:
	if current_speech_bubble:
		current_speech_bubble.destroy()
