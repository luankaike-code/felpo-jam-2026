class_name CharacterData extends Resource

enum names {
	concubine,
	king
}

static var textures: Dictionary[names, CompressedTexture2D] = {
	names.concubine: preload("res://assets/images/concubine.png"),
	names.king: preload("res://assets/images/king.png")
}
