extends ScreenWithPopUp

var packed_menu_in_game := preload("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene

@onready var locals := [$ClientLocal, $CraftLocal]
var current_local := 0
var music_player: SoundPlayer

func _ready() -> void:
	for local in locals:
		print(local is ClientLocal, local is Local)
		local.open_pop_up.connect(factory_pop_up)
	
	music_player = Sound.play_sound(SoundData.names.shop_music)
	music_player.loop_count = -1

func _pop_mensage(mensage: PopUpMensage):
	if mensage is PopUpMensageOpenPopUp:
		factory_pop_up(mensage.pop_up_scene)
	elif mensage is PopUpMensageChangeScreen:
		change_screen.emit(mensage.screen_name)
	elif mensage is PopUpMensagePause:
		for local in locals:
			local.process_mode = Node.PROCESS_MODE_DISABLED if mensage.pause else Node.PROCESS_MODE_INHERIT
		
@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") and !has_pop_up():
		factory_pop_up(packed_menu_in_game.instantiate())
	elif Input.is_action_just_pressed("ui_accept") and !has_pop_up():
		current_local += 1
		camera.to(locals[current_local%locals.size()])
