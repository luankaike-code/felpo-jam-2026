class_name ParchmentData extends Resource

enum names {
	fertility,
	infernal_fire,
	tornado,
	vitality,
	weakness,
	dark,
	light
}

static var parchments_arr: Array[names] = [
	names.fertility,
	names.infernal_fire,
	names.tornado,
	names.vitality,
	names.weakness,
	names.dark,
	names.light,
]

static var parchments_names: Dictionary[names, String] = {
	names.fertility: "Fertilidade",
	names.infernal_fire: "Fogo Infernal",
	names.tornado: "Tornado",
	names.vitality: "Vidalidade",
	names.weakness: "Fraqueça",
	names.dark: "Escuridão",
	names.light: "Iluminação",
}

static var parchments: Dictionary[names, ParchmentObj] = {
	names.fertility: ParchmentObj.new([
		RuneObj.new(RunesData.names.fire, 0),
		RuneObj.new(RunesData.names.light, 0),
	]),
	names.infernal_fire: ParchmentObj.new([
		RuneObj.new(RunesData.names.fire, 1),
		RuneObj.new(RunesData.names.fire, 1),
	]),
	names.tornado: ParchmentObj.new([
		RuneObj.new(RunesData.names.air, 1),
		RuneObj.new(RunesData.names.dark, 1),
	]),
	names.vitality: ParchmentObj.new([
		RuneObj.new(RunesData.names.earth, 0),
		RuneObj.new(RunesData.names.light, 0),
	]),
	names.weakness: ParchmentObj.new([
		RuneObj.new(RunesData.names.earth, 0),
		RuneObj.new(RunesData.names.dark, 0),
	]),
	names.dark: ParchmentObj.new([
		RuneObj.new(RunesData.names.dark, 1),
		RuneObj.new(RunesData.names.dark, 1),
	]),
	names.light: ParchmentObj.new([
		RuneObj.new(RunesData.names.light, 1),
		RuneObj.new(RunesData.names.light, 1),
	]),
}
