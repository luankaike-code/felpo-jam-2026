class_name Draggable extends Area2D

var is_dragging := false :
	set(new):
		is_dragging = new
		if is_dragging:
			_start_drag()
		else: 
			_finish_drag()

func _ready() -> void:
	pass
	#input_event.connect(on_input_event)

func _start_drag():
	print("start_drag")

func _finish_drag():
	print("finish_drag")

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position()

@warning_ignore("unused_parameter")
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	# offset = mouse_gpos - gpos
	if !event is InputEventMouseButton:
		return
	elif event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed():
		is_dragging = true
	elif event.button_index == MOUSE_BUTTON_LEFT && !event.is_pressed():
		is_dragging = false
	elif !event.button_index == MOUSE_BUTTON_LEFT:
		return
