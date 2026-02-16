extends State

var host: Stamp

func to_stand():
	host.global_position = host.current_stand.global_position
	if host.current_stand is InkStand:
		host.has_ink = true

func handle_current_paper():
	if !host.current_paper || !host.has_ink:
		return
	
	host.current_paper.add_rune(host.packed_rune.instantiate(), host.global_position)
	host.has_ink = false

func enter(host_: Stamp) -> void:
	host = host_
	handle_current_paper()
	to_stand()
	change_state.emit("Idle")
