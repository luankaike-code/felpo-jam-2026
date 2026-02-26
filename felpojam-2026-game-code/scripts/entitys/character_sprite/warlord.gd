extends CharacterSprite

var warlord_dissatisfied = preload("uid://0mwv7dt8gxtx")
var warlord_normal = preload("uid://dwdcw1pcxwbjg")
var warlord_satisfied = preload("uid://da5fimvibwson")

@onready var sprite_2d: Sprite2D = $Sprite2D

func set_version(version: CharacterData.versions) -> void:
	match version:
		CharacterData.versions.dissatisfied:
			sprite_2d.texture = warlord_dissatisfied
		CharacterData.versions.normal:
			sprite_2d.texture = warlord_normal
		CharacterData.versions.satisfied:
			sprite_2d.texture = warlord_satisfied
