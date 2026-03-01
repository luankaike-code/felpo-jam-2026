class_name StampGoingUp extends State

var host: Stamp	

func handle_current_paper():
	if host.current_paper:
		host.current_paper.is_draggable = true
		host.current_paper = null

func enter(host_) -> void:
	host = host_
	handle_current_paper()
	change_state.emit("Idle")
