extends CharacterSprite

const PRIEST_DISSATISFIED = preload("uid://b4i0xh2amc68")
const PRIEST_NORMAL = preload("uid://bhdwgra1r1daa")
const PRIEST_SATISFIED = preload("uid://d15x313k0w7cy")

@onready var sprite_2d: Sprite2D = $Sprite2D

func set_version(version: CharacterData.versions) -> void:
	match version:
		CharacterData.versions.dissatisfied:
			sprite_2d.texture = PRIEST_DISSATISFIED
		CharacterData.versions.normal:
			sprite_2d.texture = PRIEST_NORMAL
		CharacterData.versions.satisfied:
			sprite_2d.texture = PRIEST_SATISFIED
