class_name ParchmentData extends Resource

enum names {
	fertility,
	infernal_fire
}

static var parchments: Dictionary[names, ParchmentObj] = {
	names.fertility: ParchmentObj.new([
		RuneObj.new(RunesData.names.fire, 1),
		RuneObj.new(RunesData.names.water, 1),
	]),
	names.infernal_fire: ParchmentObj.new([
		RuneObj.new(RunesData.names.fire, 1),
		RuneObj.new(RunesData.names.water, 1),
	]),
}
