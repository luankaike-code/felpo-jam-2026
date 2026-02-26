extends ScreenGame

var disable_inputs: bool
@onready var tutorial_client_local: TutorialClientLocal = $ClientLocal

func _ready() -> void:
	super()
	set_disable_arrows(true)
	tutorial_client_local.table_bell_click.connect(_on_table_bell_click)

func _on_table_bell_click():
	set_disable_arrows(false)

func set_disable_arrows(value: bool):
	disable_inputs = value
	game_hud.set_arrow_enabled(GameHud.arrows.right, !value)
	game_hud.set_arrow_enabled(GameHud.arrows.left, !value)
	if !value:
		update_arrow_enabled()

func _unhandled_input(event: InputEvent) -> void:
	if paused:
		return
	
	if _handle_super_inputs(event) || disable_inputs:
		return
	elif _handle_mouse_wheel(event):
		return
	
	_handle_inputs(event)
