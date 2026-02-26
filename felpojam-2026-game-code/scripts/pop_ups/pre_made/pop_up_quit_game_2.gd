class_name PopUpQuitGame2 extends PopUpConfirm

func _ready() -> void:
	setup(
		"Poxa, joga mais um pouco por favor. Eu sei, sei. Você querer sair por um bom motivo. Mas o que custa mais uma run? ou melhor, mais um tutorialzinho? ele leva menos de um minuto :<",
		[
			PopUpConfirmButtonObj.new("sim", PopUpMensageQuit.new()),
			PopUpConfirmButtonObj.new("não", PopUpMensagePause.new(false)),
		]
	)
	
	send_pause_mensage(true)
	
	super()
