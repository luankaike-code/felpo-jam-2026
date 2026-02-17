class_name RunesData extends Node

enum names {
	fire,
	water,
	air,
	earth,
	chaos,
	order
}

var names_str: Dictionary[names, String] = {
	names.fire: "Fogo",
	names.water: "Água",
	names.air: "Ar",
	names.earth: "Terra",
	names.chaos: "Caos",
	names.order: "Ordem"
}

var packed: Dictionary[names, PackedScene] = {
	names.fire: load("res://scenes/entitys/runes/fire_rune.tscn"),
	names.water: load("res://scenes/entitys/runes/fire_rune.tscn")
}
