class_name ObjWithDescription extends Area2D

var packed_speech_bubble := load("res://scenes/HUD/speech_bubble.tscn") as PackedScene

var description: String :
	set(new):
		description = new
		_reset_description_bubble()

var sub_description: String :
	set(new):
		sub_description = new
		_reset_description_bubble()

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
	current_speech_bubble.setup([get_description()], 0)
	var min_size := Vector2(current_speech_bubble.min_width, 200)
	current_speech_bubble.position = _get_bubble_position(min_size)
	current_speech_bubble.typing_velocity = 0
	current_speech_bubble.z_index = 4000
	
	add_child(current_speech_bubble)

func get_description() -> String:
	var sub_string = ". " if sub_description else ""
	return description+sub_string+sub_description

func _close_description_bubble():
	if current_speech_bubble:
		current_speech_bubble.destroy()

func _reset_description_bubble():
	_close_description_bubble()
	_open_description_bubble()

func _get_bubble_position(min_size: Vector2) -> Vector2:
	var pos := get_global_mouse_position()
	var gap := Vector2(75, 75)
	var bubble_limit := pos + min_size + gap
	var viewport_limit := _get_viewport_limit_vector()
	
	var diference := viewport_limit - bubble_limit
	
	pos.x += diference.x-gap.x if diference.x < 0 else 0.0
	pos.y += diference.y-gap.y if diference.y < 0 else 0.0
	return to_local(pos)

func _get_viewport_limit_vector() -> Vector2:
	var viewport_rect := camera.get_viewport_rect()
	var size = viewport_rect.size/camera.zoom
	var pos = camera.global_position-(size/2)
	
	return pos + size
