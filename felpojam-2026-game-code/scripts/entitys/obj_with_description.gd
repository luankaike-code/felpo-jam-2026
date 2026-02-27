class_name ObjWithDescription extends Area2D

var packed_speech_bubble := load("res://scenes/HUD/speech_bubble.tscn") as PackedScene

var description: String
var current_speech_bubble: SpeechBubble
var mouse_is_hover := false
var camera: Camera2D

func _ready() -> void:
	camera = get_viewport().get_camera_2d()
	
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
	
	if current_speech_bubble:
		current_speech_bubble.destroy()
	
	current_speech_bubble = packed_speech_bubble.instantiate()
	current_speech_bubble.setup([description], 0)
	current_speech_bubble.position = _get_bubble_position(current_speech_bubble.min_width)
	current_speech_bubble.typing_velocity = 0
	current_speech_bubble.z_index = 4000
	
	add_child(current_speech_bubble)

func _close_description_bubble():
	if current_speech_bubble:
		current_speech_bubble.destroy()

func _get_viewport_left_border_x() -> float:
	var viewport_rect_size := camera.get_viewport_rect().size/camera.zoom.x
	var viewport_size_x := viewport_rect_size.x
	var viewport_pos_x := camera.position.x - viewport_size_x/2
	var viewport_x := viewport_size_x + viewport_pos_x
	return viewport_x

func _get_bubble_position(min_width: float) -> Vector2:
	var pos := get_global_mouse_position()
	var gap := 75
	var bubble_x := pos.x + min_width + gap
	var viewport_x := _get_viewport_left_border_x()
	
	var diference_x := viewport_x - bubble_x
	
	pos.x += diference_x-gap if diference_x < 0 else 0.0
	return to_local(pos)
