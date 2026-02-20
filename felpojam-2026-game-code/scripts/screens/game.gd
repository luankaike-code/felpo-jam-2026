extends ScreenWithPopUp

var packed_menu_in_game := preload("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene
var packed_runes_book_content := preload("res://scenes/pop_ups/pop_up_runes_book_content.tscn") as PackedScene

@onready var runes_book := $Local2/RunesBook as RunesBook
@onready var locals := [$ClientLocal, $Local2]
var current_local := 0

func _ready() -> void:
	runes_book.open.connect(open_runes_book)
	

func open_runes_book():
	factory_pop_up(packed_runes_book_content.instantiate())

func _pop_mensage(mensage: PopUpMensage):
	if mensage is PopUpMensageOpenPopUp:
		factory_pop_up(mensage.pop_up_scene)
	elif mensage is PopUpMensageChangeScreen:
		change_screen.emit(mensage.screen_name)
	elif mensage is PopUpMensagePause:
		for local in locals:
			local.process_mode = Node.PROCESS_MODE_INHERIT if mensage.pause else Node.PROCESS_MODE_DISABLED
		
@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") and !has_pop_up():
		factory_pop_up(packed_menu_in_game.instantiate())
	elif Input.is_action_just_pressed("ui_accept") and !has_pop_up():
		current_local += 1
		camera.to(locals[current_local%locals.size()])
	elif Input.is_action_just_pressed("ui_down"):
		Sound.play_sound(SoundData.names.stamping)
	elif Input.is_action_just_pressed("ui_up"):
		Sound.play_sound(SoundData.names.transition)
	elif Input.is_action_just_pressed("ui_right"):
		Sound.play_sound(SoundData.names.ink_splash)
