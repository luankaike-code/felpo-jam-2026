class_name HelperData extends Resource

static func get_client_result(order_quality: float, results: ClientResultPossibility) -> ClientResultObj:
	var current_result: ClientResult
	var current_character_version: CharacterData.versions
	
	if order_quality < 0:
		current_result = results.not_craft_all_parchments
		current_character_version = CharacterData.versions.dissatisfied
	elif order_quality >= 0.8:
		current_result = results.positive
		current_character_version = CharacterData.versions.satisfied
	elif order_quality >= 0.4:
		current_result = results.ok
		current_character_version = CharacterData.versions.normal
	else:
		current_result = results.negative
		current_character_version = CharacterData.versions.dissatisfied
	
	return ClientResultObj.new(current_result, current_character_version)
