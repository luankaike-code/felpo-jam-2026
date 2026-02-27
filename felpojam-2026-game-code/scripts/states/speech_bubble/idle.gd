extends State

var host: SpeechBubble
var is_last_dialog: bool

func enter(host_) -> void:
	set_process_over_input.emit(true)
	host = host_
	is_last_dialog = host.current_dialog_index == host.dialogs.size()-1
	
	if is_last_dialog and host.delivery_zone_count > 0:
		host.finish_all_dialogs.emit()
		to_wait_delivery()

func to_typing():
	if !is_last_dialog:
		host.current_dialog_index  += 1
		change_state.emit("Typing")
	else:
		host.finish_all_dialogs.emit()

@warning_ignore("unused_parameter")
func handle_over_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("inp_pass_dialog"):
		to_typing()

func to_wait_delivery():
	change_state.emit("WaitDelivery")
