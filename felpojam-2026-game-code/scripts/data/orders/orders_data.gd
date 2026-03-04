class_name OrdersData extends Resource

enum names {
	fetility,
	infernal_fire,
	tutorial,
	calming_water,
	dark,
	purification,
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
	names.calming_water: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.calming_water]
	]),
	names.dark: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.dark]
	]),
	names.purification: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.purification]
	]),
	names.light: OrderObj.new([
		ParchmentData.parchments[ParchmentData.names.light]
	]),
}
