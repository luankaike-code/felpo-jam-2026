class_name ParchmentData extends Resource

enum names {
	fertility
}

static var parchments: Dictionary[names, ParchmentObj] = {
	names.fertility: ParchmentObj.new([
		RuneObj.new(RunesData.names.fire, 1),
		RuneObj.new(RunesData.names.water, 1),
	])
}
