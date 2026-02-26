extends CharacterSprite

const LC_DISSATISFIED = preload("uid://d2xdf1uampfth")
const LC_SATISFIED = preload("uid://bv6xpbrwhb3bp")
const LC_NORMAL = preload("uid://d4kpoc6ki7owx")


@onready var sprite: Sprite2D = $Sprite

func set_version(versions: CharacterData.versions) -> void:
	match versions:
		CharacterData.versions.satisfied:
			sprite.texture = LC_SATISFIED
		CharacterData.versions.normal:
			sprite.texture = LC_NORMAL
		CharacterData.versions.dissatisfied:
			sprite.texture = LC_DISSATISFIED
