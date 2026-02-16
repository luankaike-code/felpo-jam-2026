extends PopUp

@onready var goto_game_btn := $CanvasLayer/Control2/MarginContainer/VBoxContainer/GotoGameBtn as Button
@onready var configs_btn := $CanvasLayer/Control2/MarginContainer/VBoxContainer/ConfigsBtn as Button
@onready var goto_menu_btn := $CanvasLayer/Control2/MarginContainer/VBoxContainer/GotoMenuBtn as Button

var packed_pop_up_configs_in_game := load("res://scenes/pop_ups/pop_up_configs_in_game.tscn") as PackedScene

func _ready() -> void:
	send_pause_mensage(true)
	
	goto_game_btn.button_up.connect(goto_game)
	configs_btn.button_up.connect(open_configs_in_game)
	goto_menu_btn.button_up.connect(goto_menu)

func goto_menu():
	send_change_screen(ScreenData.names.menu)

func goto_game():
	send_pause_mensage(false)
	queue_free()

func open_configs_in_game():
	send_open_pop_up(packed_pop_up_configs_in_game.instantiate())
	queue_free()
	
