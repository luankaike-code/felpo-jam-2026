class_name SpeechsData extends Resource

enum names {
	not_craft_all_parchemnts,
	
	concubine,
	get_order_concubine,
	concubine_result_positive,
	concubine_result_ok,
	concubine_result_negative,
	
	king,
	get_order_king,
	king_result_positive,
	king_result_ok,
	king_result_negative,
	
	warlord,
	get_order_warlord,
	warlord_result_positive,
	warlord_result_ok,
	warlord_result_negative,
	
	priest,
	get_order_priest,
	priest_result_positive,
	priest_result_ok,
	priest_result_negative,
	
	ladys_companion,
	get_order_ladys_companion,
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
		"Bom, finalmente chegamos ao seu novo lar, Aprendiz",
		"Relaxe..." ,
		"as pessoas desse palácio são muuuuito sensatas e gentis",
		"Aqui você só precisará fazer todos os pergaminhos que eles pedirem",
		"...",
		"Só relembrando para cê fazer um pergaminho é necessário...",
		"Pegar o carimbo, colocar na tinta e depois no papel.",
		"Ah, e não se esqueça do conta gotas para pontencializar as runas que precisam.",
		"Bom...",
		"Te desejo boa sorte e se tiver qualquer duvida você sempre pode mentalizar o P ou scroll e ver o que cada item faz.",
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
		"Ah, caso esqueça da receita de algum desses pergaminhos veja o meu livro de receitas com o botão clique esquerdo.",
		"Volto aqui amanhã pra ver como você se saiu com essa tarefa.",
		"Relaxe que ninguem vai te incomodar até lá. Vou dar o meu jeito para você ter esse dia de 'folga'",
	],
	names.tutorial_guy_back: [
		"Bem, vejamos o que você conseguiu fazer em um dia",
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
		"Oi, voltei aqui e...",
		"Comoo assim?...",
		"VOCÊ NÃO ACABOU??",
	],
	
	names.concubine: [
		"É um prazer conhecê-lo, feiticeiro, cheguei há pouco tempo.",
		"Gostaria de um pergaminho tornar o meu banho melhor"
	],
	names.get_order_concubine: [
		"Então como está o meu pergaminho?",
	],
	names.concubine_result_positive: [
		"Muito Agradecida",
	],
	names.concubine_result_ok: [
		"Obrigado",
	],
	names.concubine_result_negative: [
		"Vossa Majestade não gostará disso",
	],
	
	names.king: [
		"Meu querido feiticeiro, seu humilde Rei está muito fraco ",
		"para governar, pois fui amaldiçoado, ",
		"se me libertar das amarras dessa maldição",
		"e lhe garanto o seu maior desejo"
	],
	names.get_order_king: [
		"Como está?",
	],
	names.king_result_positive: [
		"Finalmente poderei voltar a viver",
	],
	names.king_result_ok: [
		"Obrigado",
	],
	names.king_result_negative: [
		"AARRRGRGRHGRGR",
	],
	
	names.warlord: [
		"Então você novo runista hum...",
		"Tomara que você seja mais esperto que o anterior...",
		"Bom, to querendo dois pergaminhos: uma para fortalecer o meu exército e outro para enfrequecer o exército inimigo",
		"É que amanhão eu irei para uma grande batalha...",
		"Uma batalha muito importante para vossa majestade...",
		"Uma batalha que definirá a sobrevivencia desse pálecio...",
		"Espero que você consiga faze-los a tempo.",
		"Volto amanhã"
	],
	names.get_order_warlord: [
		"Olá, to supresa que...",
		"O que? acho que fosse um homem? tcs",
		"...",
		"Tar os pergmainhos ai vai"
	],
	names.warlord_result_positive: [
		"Legal, era exatamente isso que eu queria...",
		"Cê tem o meu respeito",
		"Até mais maguinho",
		"Me dejese boa sorte"
	],
	names.warlord_result_ok: [
		"Acho que eles teve servir...",
		"Te recomendo melhorar... e torcer para eu não perda a batalha...",
	],
	names.warlord_result_negative: [
		"Todos Morreremos"
	],
	
	names.priest: [
		"Olha querida ovelha, sabe, meus fieis têm se perdido ultimamente...",
		"Gostaria que houvesse um pergaminho que trouxesse a luz de volta a eles",
	],
	names.get_order_priest: [
		"Olá",
	],
	names.priest_result_positive: [
		"Que Felicidade",
	],
	names.priest_result_ok: [
		"Obrigado",
	],
	names.priest_result_negative: [
		"Ah...",
	],
	
	names.ladys_companion: [
		"Olá, Runista...",
		"você já deve ter conhecido a nova dama que vossa majestade trouxe para a corte",
		"ele fez dela sua concubina... ",
		"A nossa Rainha está em prantos com medo de perder sua posição agora que o Rei favorece outra.",
		"Eu gostaria de um pergaminho cujo efeito fosse sombrio.",
		"Por favor. Não conte para ninguém"
	],
	names.get_order_ladys_companion: [
		"Voltei aqui para pegar...",
		"Aquilo"
	],
	names.ladys_companion_result_positive: [
		"Serei eternamente grata",
	],
	names.ladys_companion_result_ok: [
		"Obrigada...",
		"Até mais"
	],
	names.ladys_companion_result_negative: [
		"Obrigada por nada"
	],
}

static var dicks: Dictionary[names, String] = {
	names.tutorial_guy: "3 pergaminhos: Fogo infernal, Tornado e fertilidade",
	names.concubine: "Quero me banhar",
	names.king: "Quero quebrar minha maldição",
	names.warlord: "Quero fortalecer e enfraquecer",
	names.priest: "Quero mais iluminação",
	names.ladys_companion: "Algo sombrio"
}
