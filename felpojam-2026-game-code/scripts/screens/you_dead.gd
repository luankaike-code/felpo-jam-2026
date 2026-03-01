extends Screen

@onready var sprite_button: SpriteButton = $MarginContainer/SpriteButton
@onready var title: TextureRect = $MarginContainer/VBoxContainer/Title
@onready var character: VBoxContainer = $MarginContainer/VBoxContainer/Character

func _ready() -> void:
	sprite_button.button_up.connect(func(): change_screen.emit(ScreenData.names.menu))
	
	animate_title(true)
	enter_character()
	
func enter_character() -> void:
	var tween = get_tree().create_tween()
	
	var transparent := Color(0, 0, 0, 0)
	character.modulate = transparent
	tween.tween_property(character, "modulate", Color.WHITE, 1)

func animate_title(to_up: bool):
	var tween = get_tree().create_tween()
	var mult := -1 if to_up else 1
	var to := title.position + Vector2(0, 20) * mult
	tween.tween_property(title, "position", to, 1.5)
	tween.tween_callback(func(): animate_title(!to_up))
