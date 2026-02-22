class_name AnimationShaking extends State

@export var default_force: Vector2
@export var next_scene: String
@export var weight: float

var host: Node2D
var current_force: Vector2
var force: Vector2

var children_default_position: Dictionary[int, Vector2]

func enter(host_) -> void:
	host = host_
	current_force = default_force

func exit():
	children_default_position = {}
	
func handle_process(delta: float) -> void:
	if current_force:
		current_force = lerp(current_force, Vector2.ZERO, weight*delta)
		set_children_positition(get_random_force())
	else:
		change_state.emit(next_scene)

func set_children_positition(relative_position: Vector2) -> void:
	for child in host.get_children():
		if child is Node2D:
			var child_id = child.get_instance_id()
			var defult_pos = children_default_position.get_or_add(child_id, child.position)
			child.position = defult_pos + relative_position

func get_random_force() -> Vector2:
	return Vector2(get_random_interval(current_force.x), get_random_interval(current_force.y))
	
func get_random_interval(value: float) -> float:
	return randf_range(-value, value)
