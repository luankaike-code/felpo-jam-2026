extends ScreenWithPopUp

var packed_menu_in_game := preload("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene
@onready var camera_in_game := $CameraInGame as CameraInGame

func _pop_mensage(mensage: PopUpMensage):
	if mensage is PopUpMensageOpenPopUp:
		factory_pop_up(mensage.pop_up_scene)
	elif mensage is PopUpMensageChangeScreen:
		change_screen.emit(mensage.screen_name)

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") and !has_pop_up():
		factory_pop_up(packed_menu_in_game.instantiate())
	elif Input.is_action_just_pressed("ui_accept") and !has_pop_up():
		camera_in_game.toggle_local()
