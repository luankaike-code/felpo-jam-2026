class_name State extends Node

@warning_ignore("unused_signal")
signal change_state(state_name: String)

@warning_ignore("unused_signal")
signal set_process_over_input(state: bool)

@warning_ignore("unused_parameter")
func enter(host_) -> void:
	pass

func exit() -> void:
	pass

@warning_ignore("unused_parameter")
func handle_input(event: InputEvent) -> void:
	pass

@warning_ignore("unused_parameter")
func handle_over_input(event: InputEvent) -> void:
	pass

@warning_ignore("unused_parameter")
func handle_process(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func handle_physics_process(delta: float) -> void:
	pass
