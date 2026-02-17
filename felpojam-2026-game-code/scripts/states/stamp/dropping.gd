extends State

var host: Stamp

func handle_current_paper():
	if !host.current_paper || !host.has_ink:
		return

	host.current_paper.add_rune(host.packed_rune.instantiate(), host.global_position)
	host.has_ink = false

func enter(host_: Stamp) -> void:
	host = host_
	handle_current_paper()
	var res := host.current_stand.place_item(host)
	if !res:
		host.default_stand.place_item(host)
	change_state.emit("Idle")
