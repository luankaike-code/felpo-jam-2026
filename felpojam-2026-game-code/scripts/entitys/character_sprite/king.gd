extends CharacterSprite

const KING_DISSATISFIED = preload("uid://c3p7lhot3c7tx")
const KING_NORMAL = preload("uid://dj6gjcqe60rjk")
const KING_SATISFIED = preload("uid://cqklfqthfnbn8")


@onready var sprite_2d: Sprite2D = $Sprite2D

func set_version(version: CharacterData.versions) -> void:
	match version:
		CharacterData.versions.dissatisfied:
			sprite_2d.texture = KING_DISSATISFIED
		CharacterData.versions.normal:
			sprite_2d.texture = KING_NORMAL
		CharacterData.versions.satisfied:
			sprite_2d.texture = KING_SATISFIED
