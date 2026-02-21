class_name OrdersData extends Resource

enum names {
	more_fetility,
	infernal_fire
}

static var orders: Dictionary[names, OrderObj] = {
	names.more_fetility: OrderObj.new([
		ParchmentObj.new([
			RuneObj.new(RunesData.names.fire, 1)
		]),
		ParchmentObj.new([
			RuneObj.new(RunesData.names.water, 1),
			RuneObj.new(RunesData.names.fire, 1),
		]),
	]),
	names.infernal_fire: OrderObj.new([
		ParchmentObj.new([
			RuneObj.new(RunesData.names.fire, 2),
		]),
		ParchmentObj.new([
			RuneObj.new(RunesData.names.water, 1),
			RuneObj.new(RunesData.names.water, 1),
		]),
	])
}
