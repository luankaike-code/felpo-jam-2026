class_name Stamp extends Draggable

@onready var sprite := $Sprite as Sprite2D
@onready var state_machine := $StateMachine as StateMachine

@export var packed_rune: PackedScene
@export var defult_stand: Stand
var current_stand := defult_stand

var current_paper: Paper

var has_ink := false :
	set(new):
		has_ink = new
		modulate = Color(1.0, 1.0, 0.0, 1.0) if has_ink else Color(1.0, 1.0, 1.0, 1.0)

func _ready() -> void:
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)

func _start_drag() -> void:
	state_machine.change_state("Dragging")

func _finish_drag() -> void:
	state_machine.change_state("Dropping")

func on_area_entered(body: Area2D) -> void:
	if body is Stand:
		current_stand = body
	elif body is Paper:
		current_paper = body

func get_overlapping_stand() -> Stand:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Stand:
			return area
	return

func get_overlapping_paper() -> Paper:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Paper:
			return area
	return

func on_area_exited(body: Area2D) -> void:
	if body is Stand:
		var stand = get_overlapping_stand()
		current_stand = stand if stand else defult_stand
	elif body is Paper:
		var paper = get_overlapping_paper()
		current_paper = paper if paper else null
