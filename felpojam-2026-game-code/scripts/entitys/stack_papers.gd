class_name StackPapers extends Node2D

var packed_paper := preload("res://scenes/entitys/paper.tscn") as PackedScene
var current_paper: Paper
var max_distance_to_spaw := 50

signal want_spawn_paper(node: Node2D)

func _ready() -> void:
	call_deferred("spawn_paper")

func spawn_paper() -> void:
	var paper_scene = packed_paper.instantiate() as Paper
	paper_scene.start_drag.connect(_on_paper_start_drag)
	paper_scene.global_position = global_position
	
	current_paper = paper_scene
	want_spawn_paper.emit(paper_scene)
	
func _on_paper_start_drag():
	if current_paper.position.abs().distance_to(position) < max_distance_to_spaw:
		return
	
	current_paper.start_drag.disconnect(_on_paper_start_drag)
	spawn_paper()
