extends Screen

@onready var start_btn := $Control/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer/StartBtn as SpriteButton
@onready var configuration_btn := $Control/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer/ConfigurationBtn as SpriteButton
@onready var quit_btn := $Control/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer/QuitBtn as SpriteButton

func _ready() -> void:
	camera.global_position = global_position
	start_btn.button_up.connect(to_game)
	configuration_btn.button_up.connect(to_configurations)
	quit_btn.button_up.connect(quit.emit)

func to_configurations():
	change_screen.emit(ScreenData.names.configurations)

func to_game():
	change_screen.emit(ScreenData.names.game)
