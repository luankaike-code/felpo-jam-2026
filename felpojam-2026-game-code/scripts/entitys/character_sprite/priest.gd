extends CharacterSprite

var texture_priest_dissatisfied = preload("uid://b4i0xh2amc68")
var texture_priest_normal = preload("uid://bhdwgra1r1daa")
var texture_priest_satisfied = preload("uid://d15x313k0w7cy")

@onready var sprite_2d: Sprite2D = $Sprite2D

func set_version(version: CharacterData.versions) -> void:
	match version:
		CharacterData.versions.dissatisfied:
			sprite_2d.texture = texture_priest_dissatisfied
		CharacterData.versions.normal:
			sprite_2d.texture = texture_priest_normal
		CharacterData.versions.satisfied:
			sprite_2d.texture = texture_priest_satisfied
