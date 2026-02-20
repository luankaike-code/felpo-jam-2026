extends State

var host: SpeechBubble
var current_dialog: String

func enter(host_) -> void:
	set_process_over_input.emit(true)
	host = host_
	current_dialog = host.dialogs[host.current_dialog_index]
	host.label.text = ""
	
	var tween := get_tree().create_tween()
	host.scale = Vector2.ZERO
	
	tween.tween_property(host, "scale", Vector2.ONE, 0.3)
	type_next_letter()

func type_next_letter() -> void:
	if len(host.label.text) < len(current_dialog):
		host.label.text += current_dialog[len(host.label.text)]
		
		var timer = get_tree().create_timer(host.typing_velocity)
		timer.timeout.connect(type_next_letter)
	else:
		to_idle()

func handle_over_input(event: InputEvent) -> void:
	if event.is_pressed():
		pass_typing()

func pass_typing():
	host.label.text = current_dialog
	to_idle()

func to_idle() -> void:
	change_state.emit("Idle")
