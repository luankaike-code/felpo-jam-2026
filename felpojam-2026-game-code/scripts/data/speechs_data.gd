class_name SpeechsData extends Resource

enum names {
	concubine,
	get_order_concubine,
	concubine_result_positive,
	concubine_result_ok,
	concubine_result_negative,
	
	king,
	king_result_positive,
	king_result_ok,
	king_result_negative,
	
	warlord,
	warlord_result_positive,
	warlord_result_ok,
	warlord_result_negative,
}

static var speechs: Dictionary[names, Array] = {
	names.concubine: [
		"É um prazer conhecê-lo Runista,",
		"me chamo Romã e eu cheguei a pouco tempo,",
		"mas já estou ansiosa para cumprir com meus deveres com vossa majestade...",
		"Gostaria de aumentar a minha fertilidade",
	],
	names.get_order_concubine: [
		"vim ver o macaco"
	],
	names.concubine_result_positive: [
		"Esse pergaminho foi muito util !!! amei !!!",
	],
	names.concubine_result_ok: [
		"Obrigada pelo pergaminho",
	],
	names.concubine_result_negative: [
		"Horrivel !!! Meu utero doeu muito >:[ !!!",
	],
	
	names.king: [
		"Meu querido feiticeiro, seu humilde Rei está muito fraco ",
		"para governar, pois fui amaldiçoado, ",
		"se me libertar das amarras dessa maldição",
		"e lhe garanto o seu maior desejo"
	],
	names.king_result_positive: [
		"Esse pergaminho foi muito bom",
	],
	names.king_result_ok: [
		"Esse pergaminho foi ok",
	],
	names.king_result_negative: [
		"Esse pergaminho é um lixo",
		"Guardas o matem"
	],
	
	names.warlord: [
		"Sou o chefe de guerra",
	],
	names.warlord_result_positive: [
		"Esse pergaminho foi muito bom",
	],
	names.warlord_result_ok: [
		"Esse pergaminho foi ok",
	],
	names.warlord_result_negative: [
		"Esse pergaminho é um lixo",
		"Seu bosta",
	],
}
