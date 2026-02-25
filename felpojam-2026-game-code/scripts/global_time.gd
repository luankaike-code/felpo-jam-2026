extends Node

var time_speed := 4800
var seconds := 0.0
var minutes := 0.0
var hours := 0.0

func _physics_process(delta: float) -> void:
	seconds += delta * time_speed
	minutes = seconds/60
	hours = minutes/24
