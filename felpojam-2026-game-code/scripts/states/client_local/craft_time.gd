extends State

var host: ClientLocal
var already_connections := false
var is_current_state := false

func enter(host_) -> void:
	host = host_
	is_current_state = true
	if !already_connections:
		GlobalTime.mid_night.connect(to_client_wait_order)
		already_connections = true
	
	host.exit_character()
	host.craft_time.emit()
	
	var dick_text = SpeechsData.dicks[host.current_client_data.order_speech]
	host.add_dick.emit(dick_text)
	
	GlobalTime.mid_night_in_sec(5)

func to_client_wait_order() -> void:
	if !is_current_state:
		return
	GlobalTime.time_speed = 1
	change_state.emit("ClientWaitOrder")

func exit() -> void:
	is_current_state = false
	host.remove_dick.emit()
