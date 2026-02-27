class_name MouseManager extends Node

var cursor_normal = preload("res://assets/images/cursor.png") as CompressedTexture2D
var cursor_info = preload("res://assets/images/cursor_info.png") as CompressedTexture2D

func _ready():
	_update_cursor()
	Global.cursor_mode_changed.connect(_update_cursor)

func _update_cursor():
	var is_drag := Global.cursor_mode == MouseData.modes.drag
	Input.set_custom_mouse_cursor(cursor_normal if is_drag else cursor_info)

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("inp_toggle_cursor_mode"):
		Global.cursor_mode = MouseData.modes.info if Global.cursor_mode == MouseData.modes.drag else MouseData.modes.drag
