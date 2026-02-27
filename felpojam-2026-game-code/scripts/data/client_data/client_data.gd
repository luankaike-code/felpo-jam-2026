class_name ClientData extends Resource

enum names {
	tutorial_guy,
	warlord,
	concubine,
	king,
	priest,
	ladys_companion
}

static var order: Array[names] = [
	names.priest,
	names.ladys_companion,
	names.warlord,
	names.concubine,
	names.king,
]

static var client: Dictionary[names, ClientObj] = {
	names.tutorial_guy: ClientObj.new(
		CharacterData.names.tutorial_guy,
		SpeechsData.names.tutorial_guy,
		SpeechsData.names.tutorial_guy_back,
		OrdersData.names.tutorial,
		120.0
	),
	names.concubine: ClientObj.new(
		CharacterData.names.concubine, 
		SpeechsData.names.concubine,
		SpeechsData.names.get_order_concubine,
		OrdersData.names.more_fetility,
		40.0
	),
	names.king: ClientObj.new(
		CharacterData.names.king,
		SpeechsData.names.king,
		SpeechsData.names.king,
		OrdersData.names.infernal_fire,
		40.0
	),
	names.warlord: ClientObj.new(
		CharacterData.names.warlord,
		SpeechsData.names.warlord,
		SpeechsData.names.warlord,
		OrdersData.names.infernal_fire,
		40.0
	),
	names.priest: ClientObj.new(
		CharacterData.names.priest,
		SpeechsData.names.priest,
		SpeechsData.names.priest,
		OrdersData.names.infernal_fire,
		40.0
	),
	names.ladys_companion: ClientObj.new(
		CharacterData.names.ladys_companion,
		SpeechsData.names.ladys_companion,
		SpeechsData.names.ladys_companion,
		OrdersData.names.infernal_fire,
		40.0
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
		),
		ClientResult.new(
			SpeechsData.names.not_craft_all_parchemnts, 
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
		),
		ClientResult.new(
			SpeechsData.names.not_craft_all_parchemnts, 
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
		),
		ClientResult.new(
			SpeechsData.names.not_craft_all_parchemnts, 
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
		),
		ClientResult.new(
			SpeechsData.names.not_craft_all_parchemnts, 
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
		),
		ClientResult.new(
			SpeechsData.names.not_craft_all_parchemnts, 
			ClientResultMensageMoney.new(-50.0)
		)
	),
	names.tutorial_guy: ClientResultPossibility.new(
		ClientResult.new(
			SpeechsData.names.tutorial_guy_result_positive, 
			ClientResultMensageOpenPop.new(
				preload("res://scenes/pop_ups/pre_made/pop_up_try_tutorial_again.tscn")
			)
		),
		ClientResult.new(
			SpeechsData.names.tutorial_guy_result_ok, 
			ClientResultMensageOpenPop.new(
				preload("res://scenes/pop_ups/pre_made/pop_up_try_tutorial_again.tscn")
			)
		),
		ClientResult.new(
			SpeechsData.names.tutorial_guy_result_negative, 
			ClientResultMensageOpenPop.new(
				preload("res://scenes/pop_ups/pre_made/pop_up_try_tutorial_again.tscn")
			)
		),
		ClientResult.new(
			SpeechsData.names.tutorial_guy_not_craft_all_parchemnts, 
			ClientResultMensageOpenPop.new(
				preload("res://scenes/pop_ups/pre_made/pop_up_try_tutorial_again.tscn")
			)
		)
	),
}
