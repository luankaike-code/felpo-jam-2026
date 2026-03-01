extends Screen

@onready var sprite_button: SpriteButton = $MarginContainer/SpriteButton

func _ready() -> void:
	sprite_button.button_up.connect(func(): change_screen.emit(ScreenData.names.menu))
