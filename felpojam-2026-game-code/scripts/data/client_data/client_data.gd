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
		SpeechsData.names.Concubine, 
		[RunesData.names.water]
	)
}
