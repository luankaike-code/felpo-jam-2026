class_name ClientObj extends Resource

var character_name: CharacterData.names
var order: OrdersData.names
var order_speech: SpeechsData.names
var get_order_speech: SpeechsData.names

func _init(character_name_: CharacterData.names, order_speech_: SpeechsData.names,  get_order_speech_: SpeechsData.names, order_: OrdersData.names) -> void:
	character_name = character_name_
	order = order_
	order_speech = order_speech_
	get_order_speech = get_order_speech_
