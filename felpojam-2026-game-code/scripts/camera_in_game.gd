class_name CameraInGame extends Camera2D

@onready var state_machine := $StateMachine as StateMachine

var target: Node2D

func to(target_: Node2D):
	target = target_
	state_machine.change_state("Transition")
