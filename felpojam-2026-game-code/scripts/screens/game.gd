extends ScreenWithPopUp

var packed_menu_in_game := preload("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene

@onready var game_hud: GameHud = $GameHud

@onready var client_local: ClientLocal = $ClientLocal
@onready var craft_local: CraftLocal = $CraftLocal

@onready var locals := [client_local, craft_local, $TrashLocal]
var is_already_wheel := false

var current_local := 0 :
	set(new):
		current_local = new % locals.size()
		update_arrow_enabled()

func _ready() -> void:
	for local in locals:
		if local is Local:
			local.open_pop_up.connect(factory_pop_up)
	
	camera.add_interface(game_hud)
	
	freeze_all_craft_items(true)
	client_local.craft_time.connect(func(): freeze_all_craft_items(false))
	client_local.client_wait_order.connect(func(): 
		client_local.receive_total_parchments.emit(craft_local.get_paper_with_rune_count())
		freeze_all_craft_items(true)
	)
	
	client_local.add_dick.connect(game_hud.add_dick)
	client_local.remove_dick.connect(game_hud.remove_current_dick)
	
	game_hud.arrow_pressed.connect(_on_arrow_pressed)
	
	play_music.emit(SoundData.names.shop_music)
	game_hud.set_arrow_enabled(GameHud.arrows.left, false)

func _on_arrow_pressed(arrow: GameHud.arrows):
	togo_local(1 if arrow == GameHud.arrows.right else -1)

func togo_local(index: int):
	current_local += index
	camera.to(locals[current_local%locals.size()])

func update_arrow_enabled():
	var left_total := current_local == 0
	var right_total := current_local == locals.size()-1
	
	game_hud.set_arrow_enabled(GameHud.arrows.right, !right_total)
	game_hud.set_arrow_enabled(GameHud.arrows.left, !left_total)

func freeze_all_craft_items(value: bool):
	craft_local.set_enable_trash(!value)
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

func _unhandled_input(event: InputEvent) -> void:		
	if _handle_mouse_wheel(event):
		return
	_handle_inputs(event)
	
func _handle_mouse_wheel(event: InputEvent) -> bool:
	if !event is InputEventMouseButton:
		is_already_wheel = false
	elif !is_already_wheel && event.button_index == MOUSE_BUTTON_WHEEL_UP:
		togo_local(1)
		is_already_wheel = true
	elif !is_already_wheel && event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		togo_local(-1)
		is_already_wheel = true
	else:
		is_already_wheel = false
		return false
	return true
	
func _handle_inputs(event: InputEvent) -> void:
	if has_pop_up() || !event.is_pressed():
		return
	elif Input.is_action_just_pressed("ui_cancel"):
		factory_pop_up(packed_menu_in_game.instantiate())
	elif (Input.is_action_just_pressed("inp_toggle_local") || Input.is_action_just_pressed("inp_next_local")):
		togo_local(1)
	elif Input.is_action_just_pressed("inp_previous_local"):
		togo_local(-1)
