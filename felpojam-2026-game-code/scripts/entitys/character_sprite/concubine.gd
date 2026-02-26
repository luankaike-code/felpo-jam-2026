extends CharacterSprite

const CONCUBINE_NORMAL = preload("uid://bib8iubsat384")
const CONCUBINE_SATISFIED = preload("uid://buo86r1ow5xt5")
const CONCUBINE_DISSATISFIED = preload("uid://dlh0blm6mpvjg")



@onready var sprite_2d: Sprite2D = $Sprite2D

func set_version(version: CharacterData.versions) -> void:
	match version:
		CharacterData.versions.dissatisfied:
			sprite_2d.texture = CONCUBINE_NORMAL
		CharacterData.versions.normal:
			sprite_2d.texture = CONCUBINE_SATISFIED
		CharacterData.versions.satisfied:
			sprite_2d.texture = CONCUBINE_DISSATISFIED
