class_name OrdersData extends Resource

enum names {
	more_fetility
}

static var orders: Dictionary[names, OrderObj] = {
	names.more_fetility: OrderObj.new([
		ParchmentObj.new([
			RuneObj.new(RunesData.names.fire, 1)
		]),
		ParchmentObj.new([
			RuneObj.new(RunesData.names.water, 2),
			RuneObj.new(RunesData.names.fire, 2),
		]),
	])
}
