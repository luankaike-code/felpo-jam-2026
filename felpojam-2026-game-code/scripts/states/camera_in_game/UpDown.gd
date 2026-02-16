extends State

@export var offset_y_per_percentage := 0
var tween: Tween

func enter(host: CameraInGame) -> void:
	tween = get_tree().create_tween()
	var offset := host.get_viewport_rect().size.y*offset_y_per_percentage
	var to := host.default_pos + Vector2(0, offset)
	tween.tween_property(host, "global_position", to, 0.2)
	tween.tween_callback(to_idle)
	
func exit() -> void:
	if tween:
		tween.stop()

func to_idle() -> void:
	change_state.emit("Idle")
