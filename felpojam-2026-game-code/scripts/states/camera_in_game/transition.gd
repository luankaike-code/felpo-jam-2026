extends State

var to: Vector2
var tweens: Array[Tween]
var statics_tweens: Array[Tween]
var host: CameraInGame

func to_idle():
	change_state.emit("Idle")

func enter(host_: CameraInGame) -> void:
	host = host_
	to = host.target.global_position
	
	var hosttween := config_tween(host, 0.2)
	hosttween.tween_callback(to_idle)
	
	for interface in host.interfaces:
		config_tween(interface, 0.15, true)

func config_tween(node, duration: float, with_effect := false) -> Tween:
	if !"global_position" in node:
		return
		
	var tween = get_tree().create_tween()
	tween.tween_property(node, "global_position", to, duration)
	
	if with_effect:
		var mult := 1 if to > host.global_position else -1
		var new_to = to-Vector2(30, 0)*mult
		tween.tween_property(node, "global_position", new_to, duration)
		tween.tween_property(node, "global_position", to, duration)
		
	tween.tween_callback(to_idle)
	return tween

func exit() -> void:
	for tween in tweens:
		if tween:
			tween.kill()
