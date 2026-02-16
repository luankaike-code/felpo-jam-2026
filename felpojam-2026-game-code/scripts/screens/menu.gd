extends Screen

@onready var start_btn := $CanvasLayer/Control/MarginContainer/VBoxContainer/StartBtn as Button
@onready var configs_btn :=  $CanvasLayer/Control/MarginContainer/VBoxContainer/ConfigsBtn as Button
@onready var quit_btn := $CanvasLayer/Control/MarginContainer/VBoxContainer/QuitBtn as Button

func _ready() -> void:
	start_btn.button_up.connect(to_game)
	configs_btn.button_up.connect(to_configurations)
	quit_btn.button_up.connect(quit.emit)

func to_configurations():
	change_screen.emit(ScreenData.names.configurations)

func to_game():
	change_screen.emit(ScreenData.names.game)
