class_name PopUp extends Node2D

signal send_mensage(mensage: PopUpMensage)

func send_pause_mensage(pause: bool):
	var pause_msg := PopUpMensagePause.new(pause)
	send_mensage.emit(pause_msg)

func send_open_pop_up(pop_up: PopUp):
	var msg := PopUpMensageOpenPopUp.new(pop_up)
	send_mensage.emit(msg)

func send_change_screen(screen_name: ScreenData.names):
	var msg := PopUpMensageChangeScreen.new(screen_name)
	send_mensage.emit(msg)

func send_change_visibility(visibility: bool):
	var msg := PopUpMensageChangeVisibility.new(visibility)
	send_mensage.emit(msg)
