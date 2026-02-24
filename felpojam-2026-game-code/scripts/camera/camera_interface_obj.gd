class_name CameraInterfaceObj extends Node

var relative_pos: Vector2
var node: Control

func _init(node_: Control, dad_g_pos: Vector2) -> void:
	node = node_
	relative_pos = node.global_position+node.size - dad_g_pos
