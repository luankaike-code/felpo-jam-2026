extends ScreenWithPopUp

var packed_menu_in_game := preload("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene
var packed_runes_book_content := preload("res://scenes/pop_ups/pop_up_runes_book_content.tscn") as PackedScene

@onready var runes_book := $Local2/RunesBook as RunesBook
@onready var speech_bubble_manager := $SpeechBubbleManager as SpeechBubbleManager
@onready var locals := [$Local, $Local2]
var current_local := 0

func _ready() -> void:
	runes_book.open.connect(open_runes_book)
	
func open_dialog():
	speech_bubble_manager.create_speech_bubble([
		"teste de dialogo, aqui fu escrevo",
		"ou falo? tanto faz na real, um dialogo pode ser tanto escrito quanto falado",
		"e como esse é um um texto de teste que se dane se ele tá certo ou não",
		"é cabou o dialogo de teste, cambio",
		"*trsit (como é o som de rádio mesmo?)"
	], get_global_mouse_position())

func open_runes_book():
	factory_pop_up(packed_runes_book_content.instantiate())

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
		current_local += 1
		camera.to(locals[current_local%locals.size()])
	elif Input.is_action_just_pressed("ui_down"):
		Sound.play_sound(SoundData.names.stamping)
	elif Input.is_action_just_pressed("ui_up"):
		Sound.play_sound(SoundData.names.transition)
	elif Input.is_action_just_pressed("ui_right"):
		Sound.play_sound(SoundData.names.ink_splash)
	elif Input.is_action_just_pressed("ui_home"):
		open_dialog()
