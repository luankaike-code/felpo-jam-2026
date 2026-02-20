class_name Draggable extends Area2D

signal start_drag()
signal finish_drag()

@export var default_stand: Stand
var current_stand := default_stand

var is_dragging := false :
	set(new):
		is_dragging = new
		if is_dragging:
			start_drag.emit()
			_start_drag()
		else: 
			finish_drag.emit()
			_finish_drag()

var is_draggable := true
var was_clicked := false
var _old_z_index: int

func _ready() -> void:
	add_to_group("draggables")
	
	input_event.connect(_on_input_event)
	area_entered.connect(_on_area_entered_base_event)
	area_exited.connect(_on_area_exited_base_event)
	
	start_drag.connect(func():
		_old_z_index = z_index
		z_index = 4000
	)
	finish_drag.connect(func():
		z_index = _old_z_index
	)

func _start_drag():
	pass

func _finish_drag():
	if current_stand:
		current_stand.place_item(self)

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position()

@warning_ignore("unused_parameter")
func _on_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if !event is InputEventMouseButton || !is_draggable:
		return

	if !is_dragging:
		var draggables = get_tree().get_nodes_in_group("draggables")
		for draggable in draggables:
			if draggable.is_dragging || draggable.was_clicked:
				return

	if Global.drag_mode == ControlData.drag_mode.hold:
		if event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed():
			is_dragging = true
		elif event.button_index == MOUSE_BUTTON_LEFT && !event.is_pressed():
			is_dragging = false
	else:
		if event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed():
			was_clicked = true
			set_deferred("was_clicked", false)
			is_dragging = !is_dragging

func get_overlapping_stand() -> Stand:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Stand:
			return area
	return

func _on_area_entered_base_event(body: Area2D) -> void:
	if body is Stand:
		current_stand = body

func _on_area_exited_base_event(body: Area2D) -> void:
	if body is Stand:
		var stand = get_overlapping_stand()
		current_stand = stand if stand else default_stand
