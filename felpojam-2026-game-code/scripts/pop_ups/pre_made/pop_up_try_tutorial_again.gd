class_name PopUpTryTutorialAgain extends PopUpConfirm

func _ready() -> void:
	setup(
		"Deseja refazer o tutorial?",
		[
			PopUpConfirmButtonObj.new(
				"Sim", 
				[PopUpMensageChangeScreen.new(ScreenData.names.tutorial), PopUpMensagePause.new(false)]
			),
			PopUpConfirmButtonObj.new(
				"Não, to de boa", 
				[PopUpMensageChangeScreen.new(ScreenData.names.menu), PopUpMensagePause.new(false)]
			),
		]
	)
	super()
