class_name StampBase extends Draggable

@onready var sprite := $Sprite2D as Sprite2D
@onready var state_machine := $StateMachine as StateMachine

var rune_name: RunesData.names

var packed_stand_stamp := preload("res://scenes/entitys/stamp_stand.tscn") as PackedScene

var current_paper: Paper
var has_ink := false :
	set(new):
		has_ink = new
		modulate = ColorsData.emphasis if has_ink else Color.WHITE

func _ready() -> void:
	super()
	
	_make_stamp_connections()
	
	call_deferred("spaw_stand")
	is_freeze_change.connect(_on_is_freeze)

func _on_is_freeze():
	var color = ColorsData.disabled if is_freeze else Color.WHITE
	sprite.self_modulate = color

func _make_stamp_connections():
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)
	state_machine.change_state("Idle")

func spaw_stand():
	var stand := packed_stand_stamp.instantiate() as StampStand
	stand.setup(self)
	stand.position = position
	default_stand = stand
	spawn_node.emit(default_stand)

func _finish_drag() -> void:
	state_machine.change_state("Dropping")

func on_area_entered(body: Area2D) -> void:
	if body is Paper:
		if current_paper && current_paper.z_index > body.z_index:
			return
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
