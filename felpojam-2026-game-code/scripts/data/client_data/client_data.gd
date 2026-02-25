class_name ClientData extends Resource

enum names {
	warlord,
	concubine,
	king,
	priest,
	ladys_companion
}

static var order: Array[names] = [
	names.ladys_companion,
	names.priest,
	names.warlord,
	names.concubine,
	names.king,
]

static var client: Dictionary[names, ClientObj] = {
	names.concubine: ClientObj.new(
		CharacterData.names.concubine, 
		SpeechsData.names.concubine,
		SpeechsData.names.get_order_concubine,
		OrdersData.names.more_fetility
	),
	names.king: ClientObj.new(
		CharacterData.names.king,
		SpeechsData.names.king,
		SpeechsData.names.king,
		OrdersData.names.infernal_fire
	),
	names.warlord: ClientObj.new(
		CharacterData.names.warlord,
		SpeechsData.names.warlord,
		SpeechsData.names.warlord,
		OrdersData.names.infernal_fire
	),
	names.priest: ClientObj.new(
		CharacterData.names.priest,
		SpeechsData.names.priest,
		SpeechsData.names.priest,
		OrdersData.names.infernal_fire
	),
	names.ladys_companion: ClientObj.new(
		CharacterData.names.ladys_companion,
		SpeechsData.names.ladys_companion,
		SpeechsData.names.ladys_companion,
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
	),
	names.warlord: ClientResultPossibility.new(
		ClientResult.new(
			SpeechsData.names.warlord_result_positive, 
			ClientResultMensageMoney.new(50.0)
		),
		ClientResult.new(
			SpeechsData.names.warlord_result_ok, 
			ClientResultMensageMoney.new(25.0)
		),
		ClientResult.new(
			SpeechsData.names.warlord_result_negative, 
			ClientResultMensageMoney.new(-50.0)
		)
	),
	names.priest: ClientResultPossibility.new(
		ClientResult.new(
			SpeechsData.names.priest_result_positive, 
			ClientResultMensageMoney.new(50.0)
		),
		ClientResult.new(
			SpeechsData.names.priest_result_ok, 
			ClientResultMensageMoney.new(25.0)
		),
		ClientResult.new(
			SpeechsData.names.priest_result_negative, 
			ClientResultMensageMoney.new(-50.0)
		)
	),
	names.ladys_companion: ClientResultPossibility.new(
		ClientResult.new(
			SpeechsData.names.ladys_companion_result_positive, 
			ClientResultMensageMoney.new(50.0)
		),
		ClientResult.new(
			SpeechsData.names.ladys_companion_result_ok, 
			ClientResultMensageMoney.new(25.0)
		),
		ClientResult.new(
			SpeechsData.names.ladys_companion_result_negative, 
			ClientResultMensageMoney.new(-50.0)
		)
	),
}
