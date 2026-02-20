class_name ClientObj extends Resource

var character_name: CharacterData.names
var want: Array[RunesData.names]
var speech: SpeechsData.names

func _init(character_name_: CharacterData.names, speech_: SpeechsData.names, want_: Array[RunesData.names]) -> void:
	character_name = character_name_
	want = want_
	speech = speech_
