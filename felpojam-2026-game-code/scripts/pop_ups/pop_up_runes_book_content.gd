extends PopUp

var packed_page := preload("res://scenes/pop_ups/rune_book_content/page.tscn")

@onready var old_relative_time_speed := GlobalTime.relative_time_speed
@onready var new_relative_time_speed := 0.7
@onready var opened_rune_book: OpenedRuneBook = $opened_rune_book

var is_already_wheel := false
var page_count: int


func _ready() -> void:
	GlobalTime.relative_time_speed = new_relative_time_speed
	Sound.play_sound(SoundData.names.open_book)
	opened_rune_book.pass_page.connect(_on_pass_page)
	send_change_visibility(false)

func _on_pass_page():
	Sound.play_sound(SoundData.names.pass_page)

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if _handle_super_inputs(event):
		return
	elif _handle_mouse_wheel(event):
		return
	
	_handle_inputs(event)

func _handle_mouse_wheel(event: InputEvent) -> bool:
	if !event is InputEventMouseButton:
		is_already_wheel = false
	elif !is_already_wheel && event.button_index == MOUSE_BUTTON_WHEEL_UP:
		opened_rune_book.togo_page(1)
		is_already_wheel = true
	elif !is_already_wheel && event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		opened_rune_book.togo_page(-1)
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
		opened_rune_book.togo_page(1)
	elif Input.is_action_just_pressed("inp_previous_local"):
		opened_rune_book.togo_page(-1)

func close():
	GlobalTime.relative_time_speed = old_relative_time_speed
	Sound.play_sound(SoundData.names.close_book)
	send_change_visibility(true)
	queue_free()
