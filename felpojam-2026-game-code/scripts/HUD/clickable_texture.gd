class_name ClickableTexture extends TextureRect

signal button_up

var _is_button_down := false
var enabled := true
var current_tween: Tween

@export var use_click_sound := false
@export var click_sound: SoundData.names
@export var hover_scale := 1.2
@export var button_down_scale := 0.9

@onready var default_z_index := z_index

func _ready() -> void:
	mouse_entered.connect(_mouse_hover)
	mouse_exited.connect(_mouse_un_hover)

func _scale_to(new_scale: float) -> void:
	_kill_current_tween()
	
	current_tween = get_tree().create_tween()
	current_tween.tween_property(self, "scale", Vector2(new_scale, new_scale), 0.2)

func _kill_current_tween():
	if current_tween:
		current_tween.kill()

func _mouse_hover() -> void:
	if enabled:
		_scale_to(hover_scale)

func _mouse_un_hover() -> void:
	_scale_to(1)
	
func _button_down() -> void:
	if use_click_sound:
		Sound.play_sound(click_sound)
		
	_is_button_down = true
	_scale_to(button_down_scale)

func _button_up() -> void:
	_is_button_down = false
	_scale_to(1)
	button_up.emit()

func _gui_input(event: InputEvent) -> void:
	if !event is InputEventMouseButton || !enabled:
		return
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	
	if !_is_button_down && event.is_pressed():
		_button_down()
	elif _is_button_down && !event.is_pressed():
		_button_up()
