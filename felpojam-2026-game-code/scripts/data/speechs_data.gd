class_name SpeechsData extends Resource

enum names {
	concubine,
	concubine_result_positive,
	concubine_result_ok,
	concubine_result_negative
}

static var speechs: Dictionary[names, Array] = {
	names.concubine: [
		"É um prazer conhecê-lo Runista,",
		"me chamo Romã e eu cheguei a pouco tempo,",
		"mas já estou ansiosa para cumprir com meus deveres com vossa majestade...",
		"Gostaria de aumentar a minha fertilidade",
	],
	names.concubine_result_positive: [
		"Esse pergaminho foi muito util !!! amei !!!",
	],
	names.concubine_result_ok: [
		"Obrigada pelo pergaminho",
	],
	names.concubine_result_negative: [
		"Horrivel !!! Meu utero doeu muito >:[ !!!",
	]
}
