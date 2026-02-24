extends State

var host: ClientLocal

func enter(host_) -> void:
	host = host_
	host.exit_character()
	get_tree().create_timer(20).timeout.connect(to_client_wait_order)

func to_client_wait_order() -> void:
	change_state.emit("ClientWaitOrder")
