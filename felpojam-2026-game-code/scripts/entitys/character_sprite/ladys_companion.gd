extends CharacterSprite

@onready var sprite: Sprite2D = $Sprite

var texture_satisfied := preload("res://assets/images/characters/ladys companion
 satisfied.png")
var texture_normal := preload("res://assets/images/characters/lady's companion.png")
var texture_dissatisfied := preload("res://assets/images/characters/lady's companion 
dissatisfied.png")

func set_version(versions: CharacterData.versions) -> void:
	match versions:
		CharacterData.versions.satisfied:
			sprite.texture = texture_satisfied
		CharacterData.versions.normal:
			sprite.texture = texture_normal
		CharacterData.versions.dissatisfied:
			sprite.texture = texture_dissatisfied
