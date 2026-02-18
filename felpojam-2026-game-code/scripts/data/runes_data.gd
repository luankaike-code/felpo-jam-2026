class_name RunesData extends Node

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

static var colors: Dictionary[names, Color] = {
	names.fire: Color(0.839, 0.364, 0.322),
	names.water: Color(0.337, 0.319, 0.84),
	names.air: Color(0.84, 0.84, 0.84),
	names.earth: Color(0.398, 0.134, 0.114),
	names.chaos: Color(0.38, 0.107, 0.087),
	names.order: Color(0.87, 0.639, 0.139),
}

static var packed: Dictionary[names, PackedScene] = {
	names.fire: load("res://scenes/entitys/runes/fire_rune.tscn"),
	names.water: load("res://scenes/entitys/runes/fire_rune.tscn")
}

static var textures: Dictionary[names, CompressedTexture2D] = {
	names.fire: preload("res://assets/fire rune.png"),
	names.water: preload("res://assets/water rune.png"),
}
