extends Node

func set_to_appropriate_resolution():
	var screen_resolution = DisplayServer.window_get_size()
	var appropriate_factor: float = 10000.0
	var appropriate_resolution: Vector2i
	
	for resolution in WindowData.resolutions.values():
		var this_appropriate_factor := screen_resolution.distance_to(resolution)
		if this_appropriate_factor < appropriate_factor:
			appropriate_factor = this_appropriate_factor
			appropriate_resolution = resolution
			if this_appropriate_factor == 0:
				break
	
	set_resolution(appropriate_resolution)

func set_resolution(resolution: Vector2i):
	var window := get_window()
	window.size = resolution
	window.content_scale_size = resolution
