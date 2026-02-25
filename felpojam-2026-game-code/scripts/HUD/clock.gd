class_name ClockHud extends TextureRect

@onready var hours_ponter: TextureRect = $HoursPonter
@onready var minutes_ponter: TextureRect = $MinutesPonter

var is_playing := true
var current_tween: Tween
var speed := 4800
var hours_total := 0
var hours_clock := 1

signal mid_night
signal passed_hour(total_hour)

func set_speed_to_mid_night(time_to_mid_night: float):
	pass

func _physics_process(delta: float) -> void:
	if !is_playing:
		return
	
	var progress: float = 360.0/((60.0*60.0)/speed)*delta
	minutes_ponter.rotation_degrees += progress
	
	hours_total = int(minutes_ponter.rotation_degrees/360)%24
	hours_clock = hours_total%12
	hours_ponter.rotation_degrees = (360.0/12)*hours_clock
