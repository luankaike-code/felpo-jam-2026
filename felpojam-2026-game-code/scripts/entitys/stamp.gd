class_name Stamp extends Draggable

@onready var sprite := $Sprite as Sprite2D
@onready var state_machine := $StateMachine as StateMachine

@export var stand: StampStand

func _start_drag():
	state_machine.change_state("Dragging")

func _finish_drag():
	state_machine.change_state("Dropping")
