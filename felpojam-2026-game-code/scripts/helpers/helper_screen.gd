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
	
	Global.current_resolution = appropriate_resolution
	set_resolution(appropriate_resolution)

func get_v_sync() -> bool:
	return DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED

func set_v_sync(v_sync: bool):
	var v_sync_mode := DisplayServer.VSYNC_ENABLED if v_sync else DisplayServer.VSYNC_DISABLED
	DisplayServer.window_set_vsync_mode(v_sync_mode)

func set_window_mode(window_mode: Window.Mode):
	get_window().mode = window_mode

func set_resolution(resolution: Vector2i):
	Global.current_resolution = resolution
	var window := get_window()
	window.size = resolution
	window.content_scale_size = resolution
