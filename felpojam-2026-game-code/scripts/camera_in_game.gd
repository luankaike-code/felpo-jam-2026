class_name CameraInGame extends Camera2D

@onready var state_machine := $StateMachine as StateMachine

enum locals {
	up,
	down
}

var default_pos: Vector2
var current_local := locals.up

func _ready() -> void:
	default_pos = global_position

func toggle_local():
	match current_local:
		locals.up:
			to_local_down()
		locals.down:
			to_local_up()

func to_local_up():
	current_local = locals.up
	state_machine.change_state("Up")

func to_local_down():
	current_local = locals.down
	state_machine.change_state("Down")
