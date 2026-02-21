extends State

var host: ClientLocal
var already_connect_with_character_sprite := false

func enter(host_) -> void:
	host = host_
	
	if !already_connect_with_character_sprite:
		host.character_sprite.entered.connect(start_dialog)
		already_connect_with_character_sprite = true
	
	Sound.play_sound(SoundData.names.open_door, func():
		Sound.play_sound(SoundData.names.close_door)
		Sound.play_sound(SoundData.names.little_bell).add_event(0.2, enter_client)
	)

func enter_client():
	host.character_sprite.enter(host.current_client_data.character_name)

func start_dialog():
	var speech := SpeechsData.speechs[host.current_client_data.speech]
	var pos := host.delivery_bubble.global_position
	var speech_bubble := host.speech_bubble_manager.create_speech_bubble(speech, pos)
	speech_bubble.finish_all_dialogs.connect(to_idle_client)

func to_idle_client():
	change_state.emit("IdleClient")
