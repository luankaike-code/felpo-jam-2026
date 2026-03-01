class_name OrdersData extends Resource

enum names {
	fetility,
	infernal_fire,
	tutorial,
	banho,
	dark,
	pureza,
	warlord,
	light
}

static var orders: Dictionary[names, OrderObj] = {
	names.tutorial: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.infernal_fire],
		ParchmentData.parchments[ParchmentData.names.tornado],
		ParchmentData.parchments[ParchmentData.names.fertility]
	]),
	names.fetility: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.fertility],
	]),
	names.infernal_fire: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.infernal_fire]
	]),
	names.warlord: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.vitality],
		ParchmentData.parchments[ParchmentData.names.weakness]
	]),
	names.banho: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.banho]
	]),
	names.dark: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.dark]
	]),
	names.pureza: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.o]
	]),
	names.light: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.light]
	]),
}
