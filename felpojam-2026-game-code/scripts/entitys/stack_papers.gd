extends Node2D

var packed_paper := preload("res://scenes/entitys/paper.tscn") as PackedScene
var current_paper: Paper
var max_distance_to_spaw := 50

signal spawn_new_paper

func _ready() -> void:
	spawn_paper()

func spawn_paper() -> void:	
	var paper_scene = packed_paper.instantiate() as Paper
	paper_scene.start_drag.connect(_on_paper_start_drag)
	
	current_paper = paper_scene
	add_child(paper_scene)
	spawn_new_paper.emit()
	
func _on_paper_start_drag():
	if current_paper.position.abs().distance_to(position) < max_distance_to_spaw:
		return
	
	current_paper.start_drag.disconnect(_on_paper_start_drag)
	spawn_paper()
