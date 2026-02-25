class_name CharacterData extends Resource

enum names {
	concubine,
	king,
	warlord,
	priest,
	ladys_companion
}

enum versions {
	dissatisfied,
	normal,
	satisfied
}

static var packeds: Dictionary[names, PackedScene] = {
	names.concubine: load("res://scenes/entitys/character_sprite/concubine.tscn"),
	names.king: load("res://scenes/entitys/character_sprite/king.tscn"),
	names.warlord: load("res://scenes/entitys/character_sprite/warlord.tscn"),
	names.priest: load("res://scenes/entitys/character_sprite/priest.tscn"),
	names.ladys_companion: load("res://scenes/entitys/character_sprite/ladys_companion.tscn")
}
