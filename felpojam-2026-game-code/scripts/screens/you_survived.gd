extends Screen

@onready var goto_menu_btn: SpriteButton = $Control/MarginContainer/SpriteButton

func _ready() -> void:
	goto_menu_btn.button_up.connect(func(): change_screen.emit(ScreenData.names.menu))
