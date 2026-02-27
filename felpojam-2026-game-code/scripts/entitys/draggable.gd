class_name Draggable extends Area2D

signal start_drag()
signal finish_drag()
@warning_ignore("unused_signal")
signal spawn_node(node: Node2D)

var packed_speech_bubble := preload("res://scenes/HUD/speech_bubble.tscn") as PackedScene

var default_stand: Stand
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
var is_freeze := false

var is_draggable := true
var was_clicked := false

var description: String = "descrição"
var current_speech_bubble: SpeechBubble
var mouse_is_hover := false

func _ready() -> void:
	add_to_group("draggables")
	z_index = 200
	
	input_event.connect(_on_input_event)
	area_entered.connect(_on_area_entered_base_event)
	area_exited.connect(_on_area_exited_base_event)
	
	start_drag.connect(func():
		var bigger_z_index: int
		for draggable in get_tree().get_nodes_in_group("draggables"):
			if draggable == self:
				continue
			draggable.z_index -= 1
			if bigger_z_index < draggable.z_index:
				bigger_z_index = draggable.z_index
		z_index = bigger_z_index+1
	)
	
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
	if Global.cursor_mode != MouseData.modes.info:
		return
		
	current_speech_bubble = packed_speech_bubble.instantiate()
	current_speech_bubble.setup([description], 0)
	current_speech_bubble.position = get_local_mouse_position()
	current_speech_bubble.z_index = 4000
	add_child(current_speech_bubble)

func _close_description_bubble():
	if current_speech_bubble:
		current_speech_bubble.destroy()

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
		if event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed() && !is_freeze:
			is_dragging = true
		elif event.button_index == MOUSE_BUTTON_LEFT && !event.is_pressed():
			is_dragging = false
	else:
		if event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed() && !is_freeze:
			was_clicked = true
			set_deferred("was_clicked", false)
			is_dragging = !is_dragging
		elif is_freeze:
			is_dragging = false

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
