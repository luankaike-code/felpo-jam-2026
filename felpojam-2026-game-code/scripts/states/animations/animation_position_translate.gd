class_name AnimationPositionTranslate extends State

@export var to_position: Vector2
@export var next_state: String
@export var duration := 0.2

var host: Node2D
var tween: Tween
var to: Vector2

func enter(host_) -> void:
	host = host_
	
	to = to_position+host.position
	
	tween = get_tree().create_tween()
	tween.tween_property(host, "position", to, duration)
	tween.tween_callback(to_next_state)
	
func to_next_state():
	change_state.emit(next_state)
	
func exit() -> void:
	if tween:
		tween.stop()
		host.position = to
