class_name Screen extends Node2D

signal change_screen()
signal quit()

var camera: CameraInGame

func setup(cam: CameraInGame) -> void:
	camera = cam
