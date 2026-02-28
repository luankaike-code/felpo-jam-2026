extends PopUp

var packed_page := preload("res://scenes/pop_ups/rune_book_content/page.tscn")

@onready var tab_container: TabContainer = $Control/MarginContainer/TabContainer
@onready var old_relative_time_speed := GlobalTime.relative_time_speed
@onready var new_relative_time_speed := 0.7

var is_already_wheel := false
var page_count: int


func _ready() -> void:
	GlobalTime.relative_time_speed = new_relative_time_speed
	Sound.play_sound(SoundData.names.open_book)
	tab_container.tab_changed.connect(_on_pass_page)
	send_change_visibility(false)
	populate_book()

func populate_book():
	var arr: Array = ParchmentData.parchments_arr
	var items_count := 16
	page_count = ceili(float(arr.size()) / items_count)
	
	for i in page_count:
		var page = packed_page.instantiate() as BookPage
		var start_index := i*items_count
		var stop_index := ((i+1)*items_count)+1
		var arr_items := Helpers.get_array_range(arr, start_index, stop_index)
		
		page.setup(items_count, arr_items, i*2)
		tab_container.add_child(page)

@warning_ignore("unused_parameter")
func _on_pass_page(page_index: int):
	Sound.play_sound(SoundData.names.pass_page)

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if _handle_super_inputs(event):
		return
	elif _handle_mouse_wheel(event):
		return
	
	_handle_inputs(event)

func togo_page(index: int) -> void:
	var new_tab_index := tab_container.current_tab + index
	if new_tab_index < 0 || new_tab_index > page_count-1:
		return
		
	tab_container.current_tab = new_tab_index
	
func _handle_mouse_wheel(event: InputEvent) -> bool:
	if !event is InputEventMouseButton:
		is_already_wheel = false
	elif !is_already_wheel && event.button_index == MOUSE_BUTTON_WHEEL_UP:
		togo_page(1)
		is_already_wheel = true
	elif !is_already_wheel && event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		togo_page(-1)
		is_already_wheel = true
	else:
		is_already_wheel = false
		
	return is_already_wheel

@warning_ignore("unused_parameter")
func _handle_super_inputs(event: InputEvent) -> bool:
	if Input.is_action_just_pressed("ui_cancel"):
		close()
	else:
		return false
	return true

func _handle_inputs(event: InputEvent) -> void:
	if !event.is_pressed():
		return
	elif (Input.is_action_just_pressed("inp_toggle_local") || Input.is_action_just_pressed("inp_next_local")):
		togo_page(1)
	elif Input.is_action_just_pressed("inp_previous_local"):
		togo_page(-1)

func close():
	GlobalTime.relative_time_speed = old_relative_time_speed
	Sound.play_sound(SoundData.names.close_book)
	send_change_visibility(true)
	queue_free()
