extends Node2D

@onready var speech_bubble: SpeechBubble = $SpeechBubble

func _ready() -> void:
	speech_bubble.finish_all_dialogs.connect(func(): print("Cabo os dialogos"))
	speech_bubble.all_delivery_zones_filled.connect(print)
