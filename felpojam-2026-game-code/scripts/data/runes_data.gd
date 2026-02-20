class_name RunesData extends Resource

enum names {
	fire,
	water,
	air,
	earth,
	chaos,
	order
}

static var names_str: Dictionary[names, String] = {
	names.fire: "Fogo",
	names.water: "Água",
	names.air: "Ar",
	names.earth: "Terra",
	names.chaos: "Caos",
	names.order: "Ordem"
}

static var packed: Dictionary[names, PackedScene] = {
	names.fire: load("res://scenes/entitys/runes/fire_rune.tscn"),
	names.water: load("res://scenes/entitys/runes/fire_rune.tscn")
}

static var textures: Dictionary[names, CompressedTexture2D] = {
	names.fire: preload("res://assets/images/fire rune.png"),
	names.water: preload("res://assets/images/water rune.png"),
}
