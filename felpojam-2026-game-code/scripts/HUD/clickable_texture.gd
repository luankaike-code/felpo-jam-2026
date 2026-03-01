class_name ClickableTexture extends TextureRect

signal button_up
signal button_down

var _is_button_down := false
var _is_hover := false
var enabled := true
var current_scale_tween: Tween
var current_modulate_tween: Tween

@export var use_click_sound := false
@export var click_sound: SoundData.names
@export var hover_scale := 1.2
@export var button_down_scale := 0.9
@export var button_up_color := Color.WHITE
@export var button_down_color := Color.WHITE

@onready var default_z_index := z_index

func _ready() -> void:
	mouse_entered.connect(_mouse_hover)
	mouse_exited.connect(_mouse_un_hover)

func _scale_to(new_scale: float) -> void:
	_kill_tween(current_scale_tween)
	
	current_scale_tween = get_tree().create_tween()
	current_scale_tween.tween_property(self, "scale", Vector2(new_scale, new_scale), 0.2)

func _modulate_to(new_modulate: Color) -> void:
	_kill_tween(current_modulate_tween)
	
	current_modulate_tween = get_tree().create_tween()
	current_modulate_tween.tween_property(self, "modulate", new_modulate, 0.2)

func _kill_tween(tween: Tween):
	if tween:
		tween.kill()

func _update_mouse_hover() -> void:
	if _is_hover:
		_mouse_hover()
	else:
		_mouse_un_hover()
		
func _mouse_hover() -> void:
	if enabled:
		_scale_to(hover_scale)
		_is_hover = true

func _mouse_un_hover() -> void:
	_scale_to(1)
	_is_hover = false
	
func _button_down() -> void:
	if use_click_sound:
		Sound.play_sound(click_sound)
		
	_is_button_down = true
	_scale_to(button_down_scale)
	_modulate_to(button_down_color)
	button_down.emit()

func _button_up() -> void:
	_is_button_down = false
	_scale_to(1)
	_modulate_to(button_up_color)
	button_up.emit()
	_update_mouse_hover()

func _gui_input(event: InputEvent) -> void:
	if !event is InputEventMouseButton || !enabled:
		return
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	
	if !_is_button_down && event.is_pressed():
		_button_down()
	elif _is_button_down && !event.is_pressed():
		_button_up()
