extends CharacterSprite

const WARLORD_DISSATISFIED = preload("uid://0mwv7dt8gxtx")
const WARLORD_NORMAL = preload("uid://dwdcw1pcxwbjg")
const WARLORD_SATISFIED = preload("uid://da5fimvibwson")

@onready var sprite_2d: Sprite2D = $Sprite2D

func set_version(version: CharacterData.versions) -> void:
	match version:
		CharacterData.versions.dissatisfied:
			sprite_2d.texture = WARLORD_DISSATISFIED
		CharacterData.versions.normal:
			sprite_2d.texture = WARLORD_NORMAL
		CharacterData.versions.satisfied:
			sprite_2d.texture = WARLORD_SATISFIED
