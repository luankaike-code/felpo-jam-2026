class_name ObjWithDescription extends Area2D

var packed_speech_bubble := load("res://scenes/HUD/speech_bubble.tscn") as PackedScene

var description: String
var current_speech_bubble: SpeechBubble
var mouse_is_hover := false

func _ready() -> void:
	mouse_entered.connect(_open_description_bubble)
	mouse_exited.connect(_close_description_bubble)
	mouse_entered.connect(func(): mouse_is_hover = true)
	mouse_exited.connect(func(): mouse_is_hover = false)
	Global.cursor_mode_changed.connect(_update_description_bubble_visibility)

func _update_description_bubble_visibility():
	if Global.cursor_mode != MouseData.modes.info:
		_close_description_bubble()
	elif mouse_is_hover:
		_open_description_bubble()

func _open_description_bubble():
	if Global.cursor_mode != MouseData.modes.info || !description:
		return
	
	current_speech_bubble = packed_speech_bubble.instantiate()
	current_speech_bubble.setup([description], 0)
	current_speech_bubble.position = get_local_mouse_position()
	current_speech_bubble.z_index = 4000
	add_child(current_speech_bubble)

func _close_description_bubble():
	if current_speech_bubble:
		current_speech_bubble.destroy()
