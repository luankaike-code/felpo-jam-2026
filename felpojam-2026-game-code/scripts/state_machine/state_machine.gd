class_name StateMachine extends Node

@export var current_state: State

func _ready() -> void:
	set_process_input(false)
	for child in get_children():
		if child is State:
			child.change_state.connect(change_state)
			child.set_process_over_input.connect(set_process_input)

func find_state(state_name: String) -> State:
	var state = find_child(state_name)
	if !state is State:
		printerr("%s is not a State" % state_name)
	return state

func change_state(state_name: String) -> void:
	var new_state = find_state(state_name)
	
	set_process_input(false)
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter(get_parent())

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_over_input(event)

func _process(delta: float) -> void:
	if current_state:
		current_state.handle_process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.handle_physics_process(delta)
