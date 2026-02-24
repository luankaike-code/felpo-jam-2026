class_name SpeechBubbleManager extends Node2D

var packed_speech_bubble := preload("res://scenes/HUD/speech_bubble.tscn") as PackedScene

func create_speech_bubble(dialogs: Array, delivery_zone_count := 0, automatic_destroy := true) -> SpeechBubble:
	var speech_bubble := packed_speech_bubble.instantiate() as SpeechBubble
	speech_bubble.setup(dialogs, delivery_zone_count)
	if automatic_destroy:
		connect_signals_to_automatic_destroy(speech_bubble)
	add_child(speech_bubble)
	return speech_bubble

func connect_signals_to_automatic_destroy(speech_bubble: SpeechBubble):
	var has_delivery_zone := speech_bubble.delivery_zone_count > 0
	if has_delivery_zone:
		@warning_ignore("unused_parameter")
		speech_bubble.all_delivery_zones_filled.connect(func(x: Array[ParchmentObj]): 
			speech_bubble.call_deferred("destroy")
		)
	else:
		speech_bubble.finish_all_dialogs.connect(func(): 
			speech_bubble.call_deferred("destroy")
		)
