extends State

var tween: Tween

func to_idle():
	change_state.emit("Idle")

func enter(host_: CameraInGame) -> void:
	tween = get_tree().create_tween()
	var to = host_.target.global_position
	tween.tween_property(host_, "global_position", to, 0.2)
	tween.tween_callback(to_idle)
	
func exit() -> void:
	if tween:
		tween.stop()
