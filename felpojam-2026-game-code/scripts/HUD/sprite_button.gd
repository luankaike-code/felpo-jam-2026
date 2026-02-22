@tool
class_name SpriteButton extends MarginContainer

@export var text: String :
	set(new):
		text = new
		if label:
			label.text = text

@onready var label: Label = $MarginContainer/Label
@onready var button := $Button as TextureButton

signal button_up

func _ready() -> void:
	label.text = text
	button.button_up.connect(button_up.emit)
	button.button_down.connect(func(): Sound.play_sound(SoundData.names.pressed_button))
