extends State

var host: Stamp

func handle_current_paper():
	if !host.current_paper || !host.has_ink:
		return

	var rune = host.packed_rune.instantiate()
	var result = host.current_paper.add_rune(rune, host.global_position)
	host.has_ink = !result

func enter(host_: Stamp) -> void:
	host = host_
	handle_current_paper()
	var res := host.current_stand.place_item(host)
	if !res:
		host.default_stand.place_item(host)
	change_state.emit("Idle")
