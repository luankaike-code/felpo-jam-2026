extends Control

@onready var slider_icon: TextureRect = $SliderIcon
@onready var bar_actived: NinePatchRect = $NinePatchRect2

signal value_change(value :float)

var steps := 20
var value: float :
	set(new):
		value = new
		value_change.emit()

var is_dragging := false
var min_x := 0
var max_x := size.x

func _ready() -> void:
	min_x = 0
	max_x = size.x
	set_value(0.01)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if !is_dragging:
		return
	
	slider_icon.position.x = get_slider_icon_pos_using_mouse()
	update_bar_actived()

func set_value(new_value: float):
	value = new_value
	slider_icon.position.x = get_slider_icon_pos_using_value()
	update_bar_actived()

func get_slider_icon_pos_using_value() -> float:
	var step_value := 1 / float(steps)
	
	var value_int := int(value*100)
	var step_value_int := int(step_value*100)
	var rest := float(value_int%step_value_int)/100.0
	print(value_int, " ", value_int, " ", rest, " ", rest)
	value -= rest
	var step_index := value/(1.0/steps)
	print(step_index, " ", step_index * step_value)
	
	return step_index * step_value * size.x

func update_bar_actived():
	bar_actived.size.x = slider_icon.position.x+(slider_icon.size.x/2)

func get_slider_icon_pos_using_mouse() -> float:
	var pos_x := get_local_mouse_position().x-(slider_icon.size.x/2)
	
	var step_value := (size.x-slider_icon.size.x) / steps
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
