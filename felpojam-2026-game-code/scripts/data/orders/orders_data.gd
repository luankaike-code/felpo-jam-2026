class_name OrdersData extends Resource

enum names {
	more_fetility,
	infernal_fire,
}

static var orders: Dictionary[names, OrderObj] = {
	names.more_fetility: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.fertility],
		ParchmentData.parchments[ParchmentData.names.fertility]
	]),
	names.infernal_fire: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.infernal_fire]
	])
}
