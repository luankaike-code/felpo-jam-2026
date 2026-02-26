extends Node


var time_speed := 1.0
var total_seconds := 0.0 :
	set(new):
		total_seconds = new
		seconds = int(new)%60
		
var total_minutes := 0.0 :
	set(new):
		total_minutes = new
		minutes = int(new)%60
		
var total_hours := 0.0 :
	set(new):
		total_hours = new
		hours = int(new)%24

var alredy_midnight = false
var seconds := 0
var minutes := 0
var hours := 0 :
	set(new):
		hours = new
		if new == 0 && !alredy_midnight:
			mid_night.emit()
			alredy_midnight = true
		elif new > 0:
			alredy_midnight = false

var paused := false

signal mid_night

func mid_night_in_sec(sec: float):
	var sec_in_hour := 3600
	var sec_to_midnight := (24-hours)*sec_in_hour
	time_speed = (float(sec_to_midnight)/(sec+8))/2
	

func _physics_process(delta: float) -> void:
	if paused:
		return
		
	total_seconds += delta * time_speed
	total_minutes = total_seconds/60
	total_hours = total_minutes/24
