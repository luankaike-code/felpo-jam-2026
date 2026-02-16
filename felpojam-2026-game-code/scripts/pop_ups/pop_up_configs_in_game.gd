extends PopUp

@onready var back_btn := $CanvasLayer/Control2/MarginContainer/VBoxContainer/BackBtn as Button

var packed_menu_in_game := load("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene

func _ready() -> void:
	back_btn.button_up.connect(goto_menu_in_game)

func goto_menu_in_game():
	send_open_pop_up(packed_menu_in_game.instantiate())
	queue_free()
