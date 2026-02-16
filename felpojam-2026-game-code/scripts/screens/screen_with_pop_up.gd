class_name ScreenWithPopUp extends Screen

func has_pop_up() -> bool:
	for child in get_children():
		if child is PopUp:
			return true
	return false

func factory_pop_up(pop_up_scene: PopUp) -> PopUp:
	pop_up_scene.send_mensage.connect(_pop_mensage)
	add_child(pop_up_scene)
	return pop_up_scene

func _pop_mensage(mensage: PopUpMensage):
	pass
