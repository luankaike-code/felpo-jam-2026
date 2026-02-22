extends State

var host: Stamp

func handle_current_paper():
	if !host.current_paper || !host.has_ink:
		if host.current_stand is InkStand:
			Sound.play_sound(SoundData.names.stamp_ink)
		return

	var rune = host.packed_rune.instantiate()
	Sound.play_sound(SoundData.names.stamp_stand)
	var result = host.current_paper.add_rune(rune, host.global_position)
	host.has_ink = !result

func enter(host_: Stamp) -> void:
	host = host_
	handle_current_paper()
	change_state.emit("GoingUp")
