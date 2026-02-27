class_name SpeechsData extends Resource

enum names {
	not_craft_all_parchemnts,
	
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
	
	priest,
	priest_result_positive,
	priest_result_ok,
	priest_result_negative,
	
	ladys_companion,
	ladys_companion_result_positive,
	ladys_companion_result_ok,
	ladys_companion_result_negative,
	
	tutorial_guy,
	tutorial_guy_back,
	tutorial_guy_result_positive,
	tutorial_guy_result_ok,
	tutorial_guy_result_negative,
	tutorial_guy_not_craft_all_parchemnts
}

static var speechs: Dictionary[names, Array] = {
	names.tutorial_guy: [
		"Bom, finalmente chegamos ao seu novo lar Aprendiz",
		"Relaxe que as pessoas desse palácio são muuuuito sensatas e gentis",
		"Aqui você só precisará fazer todos os pergaminhos que eles pedirem",
		"...",
		"Só relembrando para cÊ fazer um pergaminho é necessário...",
		"Pegar o carimbo, colocar na tinta e depois no papel.",
		"Ah, e não se esqueça do conta gotas para pontencializar as runas",
		"Mas só faça isso caso você ache necessário, é claro.",
		"Bom...",
		"Te desejo boa sorte e se tiver qualquer duvida você sempre pode mentalizar o P e ver o que cada item faz.",
		"...",
		"...",
		"Vamos te testar? Só... Só pra ver.",
		"Faça pra mim 3 pergaminhos:",
		"Um pergaminho de fogo infernal, 2 runa de fogo potencializadas;",
		"Um pergaminho de tornada, 1 runa de ar potencializada e 1 runa de trevas;",
		"E um pergaminho de...hum..",
		"de...",
		"de fertilidade...",
		"1 runa de fogo e 1 runa de luz.",
		"Ah, caso esqueça da receita de algum desses pergaminhos veja o meu livro de receitas.",
		"Volto aqui amanhã pra ver como você se saiu com essa tarefa.",
		"Relaxe que ninguem vai te incomodar até lá. Vo dar o meu jeito para você ter esse dia de 'folga'"
	],
	names.tutorial_guy_back: [
		"Bem, vejamos o que você conseguiu fazer em um dia"
	],
	names.tutorial_guy_result_positive: [
		"Parece que você tem um belo talento...",
		"Nessa caso...",
		"Tchau, tchau. Agora é você e o mundo. Te desejo boa sorte",
	],
	names.tutorial_guy_result_ok : [
		"Nada mal para um iniciante...",
		"Nessa caso...",
		"Tchau, tchau. Boa sorte",
	],
	names.tutorial_guy_result_negative: [
		"Nossa...",
		"Tem certeza que você está pronto para isso?",
		"Esses pergaminhos estão errados demais para essas pessoas",
		"Elas não vão gostar muito se você errar os pergaminhos delas nesse nivel",
		"Mas eu vo deixar passar...",
		"Afinal você já é um adulto e sabe o que faz"
	],
	names.tutorial_guy_not_craft_all_parchemnts: [
		"Eia como...",
		"*suspiro*",
		"Tá, entendo...",
		"É o seu primeiro dia e você deve estar mutio nervoso",
		"Por isso você não conseguiu fazer os pergaminhos",
		"...",
		"Te recomendo treinar um pouco mais",
	],
	
	names.not_craft_all_parchemnts: [
		"Oi, volta aqui e...",
		"Comoo assim?...",
		"Você não conseguiu terminar os 2 pergaminhos ?!?!?!?!!?",
		"?!?!?!?!!??!?!?!?!!??!?!?!?!!??!?!?!?!!?",
		"A... tá bom... eles nem eram tão importantes ];",
	],
	
	names.concubine: [
		"É um prazer conhecê-lo Runista,",
		"me chamo Romã e eu cheguei a pouco tempo,",
		"mas já estou ansiosa para cumprir com meus deveres com vossa majestade...",
		"Gostaria de aumentar a minha fertilidade",
	],
	names.get_order_concubine: [
		"vim ver o macaco",
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
	
	names.priest: [
		"Sou o padre ********",
	],
	names.priest_result_positive: [
		"Esse pergaminho foi muito bom",
	],
	names.priest_result_ok: [
		"Esse pergaminho foi ok",
	],
	names.priest_result_negative: [
		"Esse pergaminho é um lixo",
		"Seu bosta",
	],
	
	names.ladys_companion: [
		"Sou a dama de companhia",
	],
	names.ladys_companion_result_positive: [
		"Esse pergaminho foi muito bom",
	],
	names.ladys_companion_result_ok: [
		"Esse pergaminho foi ok",
	],
	names.ladys_companion_result_negative: [
		"Esse pergaminho é um lixo",
		"Seu bosta",
	],
}

static var dicks: Dictionary[names, String] = {
	names.tutorial_guy: "3 pergaminhos: Fogo infernal, Tornado e fertilidade",
	names.concubine: "Quero aumentar a minha fertilidade",
	names.king: "Quero quebrar minha maldição",
	names.warlord: "Quero algo ai que esqueci",
	names.priest: "Dinheiro eu querer",
	names.ladys_companion: "Quero..."
}
