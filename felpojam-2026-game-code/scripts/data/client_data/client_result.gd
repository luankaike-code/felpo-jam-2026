class_name ClientResult extends Resource

var mensage: ClientResultMensage
var speech: SpeechsData.names

func _init(speech_: SpeechsData.names, mensage_: ClientResultMensage) -> void:
	speech = speech_
	mensage = mensage_
