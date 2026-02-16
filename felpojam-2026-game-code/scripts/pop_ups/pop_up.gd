class_name PopUp extends Node2D

signal send_mensage(mensage: PopUpMensage)

func send_pause_mensage(pause: bool):
	var pause_msg := PopUpMensagePause.new()
	pause_msg.setup(pause)
	send_mensage.emit(pause_msg)

func send_open_pop_up(pop_up: PopUp):
	var msg := PopUpMensageOpenPopUp.new()
	msg.setup(pop_up)
	send_mensage.emit(msg)

func send_change_screen(screen_name: ScreenData.names):
	var msg := PopUpMensageChangeScreen.new()
	msg.setup(screen_name)
	send_mensage.emit(msg)
