class_name SpeechBubbleManager extends Node2D

var packed_speech_bubble := preload("res://scenes/HUD/speech_bubble.tscn") as PackedScene

func create_speech_bubble(dialogs: Array[String], pos: Vector2):
	var speech_bubble := packed_speech_bubble.instantiate() as SpeechBubble
	speech_bubble.setup(dialogs, to_local(pos))
	add_child(speech_bubble)
