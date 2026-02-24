extends State

var host: ClientLocal

func enter(host_) -> void:
	host = host_
	
	host.add_character_sprite(host.current_client_data.character_name)
	
	host.character_sprite.entered.connect(start_dialog)
	
	Sound.play_sound(SoundData.names.open_door, func():
		Sound.play_sound(SoundData.names.close_door)
		Sound.play_sound(SoundData.names.little_bell).add_event(0.2, host.character_sprite.enter)
	)

func start_dialog():
	var speech := SpeechsData.speechs[host.current_client_data.speech]
	var speech_bubble := host.speech_bubble_manager.create_speech_bubble(speech)
	speech_bubble.finish_all_dialogs.connect(to_idle_client)

func to_idle_client():
	change_state.emit("IdleClient")
