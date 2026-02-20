class_name CharacterSprite extends Sprite2D

var current_character_name: CharacterData.names
@onready var stand_character_sprite: StandCharacterSprite = $StandCharacterSprite

signal entered
signal exited
signal receive_runes

func _ready() -> void:
	modulate = Color(0, 0, 0, 0)
	stand_character_sprite.receive_runes.connect(receive_runes.emit)

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
	tween.tween_callback(func(): texture = null)

func toogle_area_actived(state: bool):
	stand_character_sprite.is_actived = state
