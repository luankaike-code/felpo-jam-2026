class_name OrdersData extends Resource

enum names {
	more_fetility,
	infernal_fire,
	tutorial,
}

static var orders: Dictionary[names, OrderObj] = {
	names.tutorial: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.infernal_fire],
		ParchmentData.parchments[ParchmentData.names.tornado],
		ParchmentData.parchments[ParchmentData.names.fertility]
	]),
	names.more_fetility: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.fertility],
		ParchmentData.parchments[ParchmentData.names.fertility]
	]),
	names.infernal_fire: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.infernal_fire]
	])
}
