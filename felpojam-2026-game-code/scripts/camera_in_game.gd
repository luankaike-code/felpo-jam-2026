class_name CameraInGame extends Camera2D

@onready var state_machine := $StateMachine as StateMachine

var target: Node2D
@onready var default_zoom := zoom

func _ready() -> void:
	get_viewport().size_changed.connect(update_zoom)

func update_zoom():
	print("resimendionei galera")
	var viewport_size = get_viewport_rect().size
	
	zoom.x = default_zoom.x * viewport_size.x / 1440
	zoom.y = zoom.x

func to(target_: Node2D):
	target = target_
	state_machine.change_state("Transition")
