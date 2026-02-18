class_name CameraInGame extends Camera2D

@onready var state_machine := $StateMachine as StateMachine

var target: Node2D

func _ready() -> void:
	var viewport_size = get_viewport_rect().size
	
	zoom.x = viewport_size.x / 1440
	zoom.y = zoom.x

func to(target_: Node2D):
	target = target_
	state_machine.change_state("Transition")
