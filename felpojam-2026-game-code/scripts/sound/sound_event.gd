class_name SoundEvent extends Resource

var callable: Callable
var time_to_call: float
var current_time: float
var alredy_call := false

func _init(time_to_call_: float, callable_: Callable) -> void:
	callable = callable_
	time_to_call = time_to_call_

func reset() -> void:
	alredy_call = false

func process(delta: float) -> void:
	if alredy_call:
		return
		
	current_time += delta
	if current_time >= time_to_call:
		alredy_call = true
		callable.call()
