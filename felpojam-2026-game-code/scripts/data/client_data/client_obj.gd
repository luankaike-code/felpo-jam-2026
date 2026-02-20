class_name ClientObj extends Resource

var character_name: CharacterData.names
var order: OrdersData.names
var speech: SpeechsData.names

func _init(character_name_: CharacterData.names, speech_: SpeechsData.names, order_: OrdersData.names) -> void:
	character_name = character_name_
	order = order_
	speech = speech_
