class_name Local extends Node2D

@warning_ignore("unused_signal")
signal open_pop_up(pop_up_scene: PopUp)

func _ready() -> void:
	for child in get_children():
		if child is Draggable:
			child.spawn_node.connect(add_child)
