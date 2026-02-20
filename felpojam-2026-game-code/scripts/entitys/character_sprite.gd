class_name CharacterSprite extends Sprite2D

var current_character_name: CharacterData.names

signal entered

func enter(character_name: CharacterData.names):
	var tween := get_tree().create_tween()
	modulate = Color.BLACK
	tween.tween_property(self, "modulate", Color.WHITE, 1)
	tween.tween_callback(entered.emit)
	
	current_character_name = character_name
	texture = CharacterData.textures[character_name]

func exit():
	texture = null
