class_name ClientResultObj extends Resource

var result: ClientResult
var character_version: CharacterData.versions

func _init(result_: ClientResult, character_version_: CharacterData.versions):
	result = result_
	character_version = character_version_
