extends Node

@onready var transition := $Transition as Transition
@onready var camera_in_game := $CameraInGame as CameraInGame
@onready var music_manager: MusicManager = $MusicManager

var new_screen: Screen
var current_screen: Screen
var default_screen = ScreenData.names.you_dead

func _ready() -> void:
	HelperWindow.set_window_mode(Window.MODE_WINDOWED)
	HelperWindow.call_deferred("set_to_appropriate_resolution")
	
	create_defult_screen()
	
	transition.exit_transition_finished.connect(toggle_screen)
	
func create_defult_screen():
	new_screen = get_scene(default_screen)
	toggle_screen()

func quit():
	get_tree().quit() # WARING: can not work in mobile

func get_scene(screen_name: ScreenData.names) -> Screen:
	var packed_screen = ScreenData.packeds[screen_name]
	var screen = packed_screen.instantiate() as Screen
	screen.setup(camera_in_game)
	
	screen.change_screen.connect(change_screen)
	screen.play_music.connect(music_manager.play_music)
	
	screen.quit.connect(quit)
	return screen

func change_screen(screen_name: ScreenData.names) -> void:
	new_screen = get_scene(screen_name)
	transition.start_transition()

func toggle_screen():
	if current_screen:
		current_screen.queue_free()
	current_screen = new_screen
	add_child(current_screen)
