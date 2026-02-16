extends Screen

@onready var start_btn := $Control/MarginContainer/VBoxContainer/StartBtn as Button
@onready var quit_btn := $Control/MarginContainer/VBoxContainer/QuitBtn as Button

func _ready() -> void:
	start_btn.button_up.connect(to_game)
	quit_btn.button_up.connect(quit.emit)

func to_game():
	change_screen.emit(ScreenData.names.game)
