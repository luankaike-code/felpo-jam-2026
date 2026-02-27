class_name CameraInGame extends Camera2D

@onready var state_machine := $StateMachine as StateMachine
@onready var default_zoom := zoom
@onready var old_global_pos := position

var target: Node2D
var statics: Array
var interfaces: Array[Node2D]

signal change_zoom(new_zoom: Vector2)

func _ready() -> void:
	get_viewport().size_changed.connect(update_zoom)

func update_zoom():
	var viewport_size = get_viewport_rect().size
	
	zoom.x = default_zoom.x * viewport_size.x / 1440
	zoom.y = zoom.x
	
	change_zoom.emit(zoom)
	

func add_interface(node: Node2D) -> void:
	interfaces.push_back(node)

func to(target_: Node2D):
	target = target_
	state_machine.change_state("Transition")
	
