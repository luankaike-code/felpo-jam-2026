extends State

var host: ClientLocal

func enter(host_) -> void:
	host = host_
	
	host.add_character_sprite(host.current_client_data.character_name)
	
	host.character_sprite.entered.connect(start_dialog)
	
	host.enter_character()

func start_dialog():
	host.character_sprite.entered.disconnect(start_dialog)
	var speech := SpeechsData.speechs[host.current_client_data.speech]
	var speech_bubble := host.speech_bubble_manager.create_speech_bubble(speech)
	speech_bubble.finish_all_dialogs.connect(to_craft_time)

func to_craft_time():
	change_state.emit("CraftTime")
