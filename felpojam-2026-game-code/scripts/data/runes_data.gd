class_name RunesData extends Resource

enum names {
	fire,
	water,
	air,
	earth,
	chaos,
	order
}

static var colors: Dictionary[names, Color] = {
	names.fire: Color(1.0, 0.0, 0.0, 1.0),
	names.water: Color(0.0, 1.0, 1.0, 1.0)
}

static var packed: Dictionary[names, PackedScene] = {
	names.fire: load("res://scenes/entitys/runes/fire_rune.tscn"),
	names.water: load("res://scenes/entitys/runes/fire_rune.tscn")
}

static var textures: Dictionary[names, CompressedTexture2D] = {
	names.fire: preload("res://assets/images/fire rune.png"),
	names.water: preload("res://assets/images/water rune.png"),
}
