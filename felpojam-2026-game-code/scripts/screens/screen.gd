class_name Screen extends Node2D

@warning_ignore("unused_signal")
signal change_screen()
@warning_ignore("unused_signal")
signal quit()
@warning_ignore("unused_signal")
signal play_music(music_name: SoundData.names)

var camera: CameraInGame

func setup(cam: CameraInGame) -> void:
	camera = cam
