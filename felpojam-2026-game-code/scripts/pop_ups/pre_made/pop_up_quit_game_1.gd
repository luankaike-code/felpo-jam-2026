class_name PopUpQuitGame1 extends PopUpConfirm

var packed_pop_up_game_quit_2 := load("res://scenes/pop_ups/pre_made/pop_up_quit_game_2.tscn") as PackedScene

func _ready() -> void:
	setup(
		"Dejesa mesmo sair?",
		[
			PopUpConfirmButtonObj.new("sim", PopUpMensageOpenPopUp.new(packed_pop_up_game_quit_2.instantiate())),
			PopUpConfirmButtonObj.new("não", PopUpMensagePause.new(false)),
		]
	)
	
	send_pause_mensage(true)
	
	super()
