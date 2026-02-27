extends ScreenWithPopUp

var packed_pop_up_confirm := load("res://scenes/pop_ups/pre_made/pop_up_quit_game.tscn") as PackedScene

@onready var start_btn := $Control/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer/StartBtn as SpriteButton
@onready var configuration_btn := $Control/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer/ConfigurationBtn as SpriteButton
@onready var quit_btn := $Control/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer/QuitBtn as SpriteButton
@onready var tutorial_btn: SpriteButton = $Control/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer/Tutorial

var music: SoundPlayer

func _ready() -> void:
	camera.global_position = global_position
	
	start_btn.button_up.connect(to_game)
	configuration_btn.button_up.connect(to_configurations)
	quit_btn.button_up.connect(quit_button_pressed)
	tutorial_btn.button_up.connect(to_tutorial)
	
	play_music.emit(SoundData.names.menu_music)

func to_tutorial():
	change_screen.emit(ScreenData.names.tutorial)

func to_configurations():
	change_screen.emit(ScreenData.names.configurations)

func _pop_mensage(mensage: PopUpMensage):
	if mensage is PopUpMensageOpenPopUp:
		factory_pop_up(mensage.pop_up_scene)
	if mensage is PopUpMensageQuit:
		quit.emit()

func to_game():
	change_screen.emit(ScreenData.names.game)

func quit_button_pressed():
	var pop_up := packed_pop_up_confirm.instantiate()
	factory_pop_up(pop_up)
