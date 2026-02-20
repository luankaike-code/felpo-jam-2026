extends State

var host: ClientLocal

func enter(host_) -> void:
	host = host_
	
	if !host.character_sprite.entered.is_connected(start_dialog):
		host.character_sprite.entered.connect(start_dialog)
	
	var client_name := ClientData.order[host.current_client_order_index]
	host.client = ClientData.client[client_name]
	
	host.current_speech_name = host.client.speech
	Sound.play_sound(SoundData.names.character_enter, enter_client)
	
func enter_client():
	host.character_sprite.enter(host.client.character_name)

func start_dialog():
	var speech := SpeechsData.speechs[host.client.speech]
	var pos := host.character_sprite.global_position
	var speech_bubble := host.speech_bubble_manager.create_speech_bubble(speech, pos)
	speech_bubble.finish_all_dialogs.connect(to_idle_client)

func to_idle_client():
	change_state.emit("IdleClient")
