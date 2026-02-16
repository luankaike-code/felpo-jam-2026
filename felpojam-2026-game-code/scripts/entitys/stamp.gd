class_name Stamp extends Draggable

@onready var sprite := $Sprite as Sprite2D
@onready var state_machine := $StateMachine as StateMachine

@export var defult_stand: Stand
var current_stand := defult_stand

func _ready() -> void:
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)

func _start_drag() -> void:
	state_machine.change_state("Dragging")

func _finish_drag() -> void:
	state_machine.change_state("Dropping")

func on_area_entered(body: Area2D) -> void:
	print("adsad", body)
	if body is Stand:
		print(body, current_stand)
		current_stand = body

func get_stand_into_area() -> Stand:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if !body is Stand:
			return body
	return

func on_area_exited(body: Area2D) -> void:
	if body is Stand:
		var stand_into_area = get_stand_into_area()
		current_stand = stand_into_area if stand_into_area else defult_stand
