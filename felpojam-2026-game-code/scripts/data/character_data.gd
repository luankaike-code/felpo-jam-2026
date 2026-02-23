class_name CharacterData extends Resource

enum names {
	concubine,
	king,
	warlord
}

static var packeds: Dictionary[names, PackedScene] = {
	names.concubine: preload("res://scenes/entitys/character_sprite/concubine.tscn"),
	names.king: preload("res://scenes/entitys/character_sprite/king.tscn"),
	names.warlord: preload("res://scenes/entitys/character_sprite/warlord.tscn")
}
