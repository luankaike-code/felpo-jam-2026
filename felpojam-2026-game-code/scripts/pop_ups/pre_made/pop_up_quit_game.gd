class_name PopUpQuitGame1 extends PopUpConfirm

var packed_pop_up_game_quit_2 := load("res://scenes/pop_ups/pre_made/pop_up_quit_game_2.tscn") as PackedScene

func _ready() -> void:
	setup(
		"Já deseja deixar Runistia?",
		[
			PopUpConfirmButtonObj.new("sim", PopUpMensageQuit.new()),
			PopUpConfirmButtonObj.new("não", PopUpMensagePause.new(false)),
		]
	)
	
	send_pause_mensage(true)
	
	super()
