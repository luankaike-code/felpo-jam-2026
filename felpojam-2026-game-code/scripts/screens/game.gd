extends ScreenWithPopUp

var packed_menu_in_game := preload("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene

@onready var game_hud: Node2D = $GameHud

@onready var client_local: ClientLocal = $ClientLocal
@onready var craft_local: CraftLocal = $CraftLocal

@onready var locals := [client_local, craft_local]

var current_local := 0 :
	set(new):
		current_local = new % locals.size()
		update_arrow_enabled()

func _ready() -> void:
	for local in locals:
		local.open_pop_up.connect(factory_pop_up)
	
	camera.add_interface(game_hud)
	
	client_local.client_wait_order.connect(func(): freeze_all_craft_items(true))
	client_local.exit_client.connect(func(): freeze_all_craft_items(false))
	
	game_hud.arrow_pressed.connect(_on_arrow_pressed)
	
	play_music.emit(SoundData.names.shop_music)
	game_hud.set_arrow_enabled(GameHud.arrows.left, false)

func _on_arrow_pressed(arrow: GameHud.arrows):
	current_local = 1 if arrow == GameHud.arrows.right else 0
	
	camera.to(locals[current_local%locals.size()])

func update_arrow_enabled():
	var is_local_right := current_local == 1
	game_hud.set_arrow_enabled(GameHud.arrows.right, !is_local_right)
	game_hud.set_arrow_enabled(GameHud.arrows.left, is_local_right)

func freeze_all_craft_items(value: bool):
	for draggable in get_tree().get_nodes_in_group("draggables"):
		if draggable is Stamp || draggable is Dropper:
			draggable.is_freeze = value

func _pop_mensage(mensage: PopUpMensage):
	if mensage is PopUpMensageOpenPopUp:
		factory_pop_up(mensage.pop_up_scene)
	elif mensage is PopUpMensageChangeScreen:
		change_screen.emit(mensage.screen_name)
	elif mensage is PopUpMensagePause:
		for local in locals:
			local.process_mode = Node.PROCESS_MODE_DISABLED if mensage.pause else Node.PROCESS_MODE_INHERIT

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") and !has_pop_up():
		factory_pop_up(packed_menu_in_game.instantiate())
	elif Input.is_action_just_pressed("ui_accept") and !has_pop_up():
		current_local += 1
		camera.to(locals[current_local])
