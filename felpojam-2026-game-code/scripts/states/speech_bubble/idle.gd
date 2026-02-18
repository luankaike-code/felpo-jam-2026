extends State

var host: SpeechBubble

func enter(host_) -> void:
	host = host_
	var timer = get_tree().create_timer(0.1)
	timer.timeout.connect(to_typing)

func to_typing():
	print(host.current_dialog_index < host.dialogs.size(), host.current_dialog_index, " ", host.dialogs.size())
	if host.current_dialog_index < host.dialogs.size()-1:
		host.current_dialog_index  += 1
		change_state.emit("Typing")
	else:
		host.queue_free()
