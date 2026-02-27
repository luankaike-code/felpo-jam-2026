class_name RunesData extends Resource

enum names {
	fire,
	water,
	air,
	earth,
	dark,
	light,
}

static var string: Dictionary[names, String] = {
	names.fire: "Fogo",
	names.water: "Água",
	names.air: "Ar",
	names.earth: "Terra",
	names.dark: "Trevas",
	names.light: "Luz",
}

static var colors: Dictionary[names, Color] = {
	names.fire: Color(1.0, 0.0, 0.0, 1.0),
	names.water: Color(0.0, 1.0, 1.0, 1.0),
	names.air: Color(0.797, 0.824, 0.914, 1.0),
	names.earth: Color(0.83, 0.392, 0.1, 1.0),
	names.dark: Color(0.682, 0.012, 0.553, 1.0),
	names.light: Color(1.0, 0.776, 0.051, 1.0),
}

static var textures: Dictionary[names, CompressedTexture2D] = {
	names.fire: preload("res://assets/images/runes/fire rune.png"),
	names.water: preload("res://assets/images/runes/water rune.png"),
	names.air: preload("res://assets/images/runes/air rune.png"),
	names.earth: preload("res://assets/images/runes/earth rune.png"),
	names.dark: preload("res://assets/images/runes/fire rune.png"),
	names.light: preload("res://assets/images/runes/fire rune.png"),
}
