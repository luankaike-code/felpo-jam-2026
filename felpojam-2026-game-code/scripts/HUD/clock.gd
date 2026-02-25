class_name ClockHud extends TextureRect

@onready var hours_ponter: TextureRect = $HoursPonter
@onready var minutes_ponter: TextureRect = $MinutesPonter

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	minutes_ponter.rotation_degrees = (360.0/60)*GlobalTime.total_minutes
	hours_ponter.rotation_degrees = (360.0/12)*GlobalTime.total_hours
