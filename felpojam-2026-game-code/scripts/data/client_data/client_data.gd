class_name ClientData extends Resource

enum names {
	concubine,
	king
}

static var order: Array[names] = [
	names.concubine,
	names.king
]

static var client: Dictionary[names, ClientObj] = {
	names.concubine: ClientObj.new(
		CharacterData.names.concubine, 
		SpeechsData.names.concubine, 
		OrdersData.names.more_fetility
	),
	names.king: ClientObj.new(
		CharacterData.names.king, 
		SpeechsData.names.king, 
		OrdersData.names.infernal_fire
	)
}

static var client_result: Dictionary[names, ClientResultPossibility] = {
	names.concubine: ClientResultPossibility.new(
		ClientResult.new(
			SpeechsData.names.concubine_result_positive, 
			ClientResultMensageMoney.new(50.0)
		),
		ClientResult.new(
			SpeechsData.names.concubine_result_ok, 
			ClientResultMensageMoney.new(25.0)
		),
		ClientResult.new(
			SpeechsData.names.concubine_result_negative, 
			ClientResultMensageMoney.new(-50.0)
		)
	),
	names.king: ClientResultPossibility.new(
		ClientResult.new(
			SpeechsData.names.king_result_positive, 
			ClientResultMensageMoney.new(50.0)
		),
		ClientResult.new(
			SpeechsData.names.king_result_ok, 
			ClientResultMensageMoney.new(25.0)
		),
		ClientResult.new(
			SpeechsData.names.king_result_negative, 
			ClientResultMensageMoney.new(-50.0)
		)
	)
}
