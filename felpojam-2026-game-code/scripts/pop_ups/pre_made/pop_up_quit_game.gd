class_name PopUpQuitGame1 extends PopUpConfirm

func _ready() -> void:
	setup(
		"Já deseja deixar Runistia?",
		[
			PopUpConfirmButtonObj.new("sim", [PopUpMensageQuit.new(), PopUpMensagePause.new(false)]),
			PopUpConfirmButtonObj.new("não",[PopUpMensagePause.new(false)]),
		]
	)
	
	send_pause_mensage(true)
	
	super()
