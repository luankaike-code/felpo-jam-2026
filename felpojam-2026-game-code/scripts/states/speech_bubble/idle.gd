extends State

var host: SpeechBubble

func enter(host_) -> void:
	set_process_over_input.emit(true)
	host = host_

func to_typing():
	if host.current_dialog_index < host.dialogs.size()-1:
		host.current_dialog_index  += 1
		change_state.emit("Typing")
	else:
		host.finish_all_dialogs.emit()
		host.queue_free()

func handle_over_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_home"):
		to_typing()
