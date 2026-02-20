class_name ClientData extends Resource

enum names {
	concubine
}

static var order: Array[names] = [
	names.concubine
]

static var client: Dictionary[names, ClientObj] = {
	names.concubine: ClientObj.new(
		CharacterData.names.concubine, 
		SpeechsData.names.concubine, 
		OrdersData.names.more_fetility
	)
}

static var client_result: Dictionary[names, ClientResultPossibility] = {
	names.concubine: ClientResultPossibility.new(
		ClientResult.new(SpeechsData.names.concubine_result_positive, 50.0),
		ClientResult.new(SpeechsData.names.concubine_result_ok, 25.0),
		ClientResult.new(SpeechsData.names.concubine_result_negative, -50.0)
	)
}
