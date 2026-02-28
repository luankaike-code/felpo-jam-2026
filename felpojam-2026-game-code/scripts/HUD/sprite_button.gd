@tool
class_name SpriteButton extends MarginContainer

@export var text: String :
	set(new):
		text = new
		if label:
			label.text = text

@onready var label: Label = $MarginContainer/Label
@onready var button := $Button as TextureButton

var tween: Tween

signal button_up

func _ready() -> void:
	label.text = text
	
	button.button_up.connect(button_up.emit)
	button.button_down.connect(_play_sound)
	button.mouse_entered.connect(func(): set_scale_anim(1.2))
	button.mouse_exited.connect(func(): set_scale_anim(1))

func set_scale_anim(new_scale: float) -> void:
	if tween:
		tween.kill()
	
	tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(new_scale, new_scale), 0.2)

func _play_sound() -> void:
	Sound.play_sound(SoundData.names.pressed_button)
