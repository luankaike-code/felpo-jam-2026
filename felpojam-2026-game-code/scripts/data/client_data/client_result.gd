class_name ClientResult extends Resource

var money: float
var speech: SpeechsData.names

func _init(speech_: SpeechsData.names, money_: float) -> void:
	speech = speech_
	money = money_
