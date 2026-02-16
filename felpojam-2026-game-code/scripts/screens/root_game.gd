extends Node

var current_screen: Screen
var default_screen = ScreenData.names.menu

func _ready() -> void:
	change_screen(default_screen)

func change_screen(screen_name: ScreenData.names):
	var packed_screen = ScreenData.packeds[screen_name]
	var screen = packed_screen.instantiate() as Screen
	screen.change_screen.connect(change_screen)
	
	if current_screen:
		current_screen.queue_free()
	current_screen = screen
	add_child(current_screen)
