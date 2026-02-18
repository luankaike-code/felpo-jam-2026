extends State

var host: SpeechBubble
var current_dialog: String
var current_letter_index: int

func enter(host_) -> void:
	host = host_
	current_dialog = host.dialogs[host.current_dialog_index]
	host.label.text = ""
	current_letter_index = 0
	
	var tween := get_tree().create_tween()
	host.scale = Vector2.ZERO
	
	tween.tween_property(host, "scale", Vector2.ONE, 0.3)
	type_next_letter()
	

func type_next_letter() -> void:
	if current_letter_index < len(current_dialog):
		host.label.text += current_dialog[current_letter_index]
		current_letter_index += 1
		
		var timer = get_tree().create_timer(host.typing_velocity)
		timer.timeout.connect(type_next_letter)
	else:
		to_idle()

func to_idle() -> void:
	change_state.emit("Idle")
