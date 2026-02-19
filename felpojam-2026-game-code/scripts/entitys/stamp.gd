class_name Stamp extends Draggable

@onready var sprite := $Sprite as Sprite2D
@onready var state_machine := $StateMachine as StateMachine

@export var packed_rune: PackedScene

var current_paper: Paper

var rune_name: RunesData.names

var has_ink := false :
	set(new):
		has_ink = new
		modulate = Color(1.0, 1.0, 0.0, 1.0) if has_ink else Color(1.0, 1.0, 1.0, 1.0)

func _ready() -> void:
	super()
	
	rune_name = packed_rune.instantiate().rune_name
	sprite.texture = StampData.textures[rune_name]
	
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)
	

func _start_drag() -> void:
	state_machine.change_state("Dragging")

func _finish_drag() -> void:
	state_machine.change_state("Dropping")

func on_area_entered(body: Area2D) -> void:
	if body is Paper:
		current_paper = body

func get_overlapping_paper() -> Paper:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Paper:
			return area
	return

func on_area_exited(body: Area2D) -> void:
	if body is Paper:
		var paper = get_overlapping_paper()
		current_paper = paper if paper else null
