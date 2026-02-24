extends Screen

@onready var locals := [$ClientLocal, $CraftLocal]
var current_local_index := 1

func _ready() -> void:
	camera.global_position = locals[current_local_index].global_position
	disable_nodes($CraftLocal.get_children())

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		current_local_index += 1
		current_local_index %= locals.size()
		camera.to(locals[current_local_index])

func disable_nodes(nodes: Array):
	for node in nodes:
		if !node is Node2D:
			return

		if node is Draggable:
			node.is_draggable = false
		else:
			disable_nodes(node.get_children())
