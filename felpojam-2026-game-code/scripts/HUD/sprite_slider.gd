extends Control

@onready var slider_icon: TextureRect = $SliderIcon
@onready var bar_actived: NinePatchRect = $NinePatchRect2

signal value_change(value :float)

var steps := 20
var value: float :
	set(new):
		value = new
		value_change.emit(value)
var is_dragging := false
var min_x := 0
var max_x := size.x

func _ready() -> void:
	min_x = 0
	max_x = size.x
	bar_actived.size.x = slider_icon.position.x+(slider_icon.size.x/2)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if !is_dragging:
		return
	
	slider_icon.position.x = get_value_in_interval(slider_icon.size.x)
	bar_actived.size.x = slider_icon.position.x+(slider_icon.size.x/2)

func get_value_in_interval(size_x: float) -> float:
	var pos_x := get_local_mouse_position().x-(size_x/2)
	
	var step_value := (size.x-size_x) / steps
	var step_index := int(pos_x / step_value)
	var final_pos_x: float
	
	if step_index > steps:
		step_index = steps
		final_pos_x = (step_value * steps)
	elif step_index < 0:
		step_index = 0
		final_pos_x = 0
	else:
		final_pos_x = step_index * step_value
		
	value = (1.0/steps)*step_index
	return final_pos_x

func _gui_input(event: InputEvent) -> void:
	if !event is InputEventMouseButton:
		return
		
	is_dragging = event.is_pressed()
