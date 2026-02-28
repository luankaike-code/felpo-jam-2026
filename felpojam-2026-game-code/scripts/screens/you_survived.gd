extends Screen

@onready var goto_menu_btn: SpriteButton = $MarginContainer/VBoxContainer/HBoxContainer/GotoMuneBtn

func _ready() -> void:
	goto_menu_btn.button_up.connect(func(): change_screen.emit(ScreenData.names.menu))

func _process(delta: float) -> void:
	pass
