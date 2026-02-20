extends PopUp

var packed_menu_in_game := load("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		goto_menu_in_game()

func goto_menu_in_game():
	send_open_pop_up(packed_menu_in_game.instantiate())
	queue_free()
