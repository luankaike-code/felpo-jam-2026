class_name CharacterSprite extends Sprite2D

var current_character_name: CharacterData.names

signal entered
signal exited

func _ready() -> void:
	modulate = Color(0, 0, 0, 0)

func enter(character_name: CharacterData.names):
	var tween := get_tree().create_tween()
	
	tween.tween_property(self, "modulate", Color.WHITE, 1).set_ease(Tween.EASE_IN)
	tween.tween_callback(entered.emit)
	
	current_character_name = character_name
	texture = CharacterData.textures[character_name]

func exit():
	var tween := get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(0, 0, 0, 0), 1).set_ease(Tween.EASE_IN)
	tween.tween_callback(exited.emit)
