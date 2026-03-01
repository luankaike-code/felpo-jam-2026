class_name RunesData extends Resource

enum names {
	fire,
	water,
	air,
	earth,
	dark,
	light,
	
	order,
}

static var string: Dictionary[names, String] = {
	names.fire: "Fogo",
	names.water: "Água",
	names.air: "Ar",
	names.earth: "Terra",
	names.dark: "Trevas",
	names.light: "Luz",
	
	names.order: "Ordem"
}

static var colors: Dictionary[names, Color] = {
	names.fire: Color(1.0, 0.0, 0.0, 1.0),
	names.water: Color(0.0, 1.0, 1.0, 1.0),
	names.air: Color(0.797, 0.824, 0.914, 1.0),
	names.earth: Color(0.83, 0.392, 0.1, 1.0),
	names.dark: Color(0.682, 0.012, 0.553, 1.0),
	names.light: Color(1.0, 0.776, 0.051, 1.0),
	
	names.order: Color(1.0, 0.663, 1.0, 1.0),
}

static var textures: Dictionary[names, CompressedTexture2D] = {
	names.fire: preload("res://assets/images/runes/runes.png"),
	names.water: preload("res://assets/images/runes/runes.png"),
	names.air: preload("res://assets/images/runes/runes.png"),
	names.earth: preload("res://assets/images/runes/runes.png"),
	names.dark: preload("res://assets/images/runes/runes.png"),
	names.light: preload("res://assets/images/runes/runes.png"),
	
	names.order: preload("res://assets/images/runes/runes.png"),
}

static var frames_count: Dictionary[names, Vector2i] = {
	names.fire: Vector2(4, 1),
	names.water: Vector2(4, 1),
	names.air: Vector2(4, 1),
	names.earth: Vector2(4, 1),
	names.dark: Vector2(4, 1),
	names.light: Vector2(4, 1),
	
	names.order: Vector2(4, 1),
}

static var frame: Dictionary[names, int] = {
	names.fire: 2,
	names.water: 0,
	names.air: 1,
	names.earth: 3,
	names.dark: 1,
	names.light: 1,
	names.order: 3,
}
