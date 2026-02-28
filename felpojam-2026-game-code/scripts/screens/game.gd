class_name ScreenGame extends ScreenWithPopUp

var packed_menu_in_game := preload("res://scenes/pop_ups/pop_up_menu_in_game.tscn") as PackedScene

@onready var game_hud: GameHud = $GameHud

@onready var client_local: ClientLocal = $ClientLocal
@onready var craft_local: CraftLocal = $CraftLocal
@onready var paper_stand: Stand = $PaperStand

@onready var locals := [client_local, craft_local, $TrashLocal]
var is_already_wheel := false
var current_transition_sound: SoundPlayer
var paused := false
var visibility := true

var current_local := 0 :
	set(new):
		current_local = new % locals.size()
		update_arrow_enabled()

func _ready() -> void:
	for local in locals:
		if local is Local:
			local.open_pop_up.connect(factory_pop_up)
			local.spawn_node.connect(spawn_node)
			
	camera.add_interface(game_hud)
	
	freeze_all_craft_items_and_the_trash(true, false)
	client_local.craft_time.connect(func(): freeze_all_craft_items_and_the_trash(false, false))
	client_local.client_wait_order.connect(func(): 
		client_local.receive_total_parchments.emit(craft_local.get_paper_with_rune_count())
		freeze_all_craft_items_and_the_trash(true, true)
	)
	client_local.exit_client.connect(func(): freeze_all_craft_items_and_the_trash(true, false))
	
	client_local.add_dick.connect(game_hud.add_dick)
	client_local.remove_dick.connect(game_hud.remove_current_dick)
	
	game_hud.arrow_pressed.connect(_on_arrow_pressed)
	
	play_music.emit(SoundData.names.shop_music)
	game_hud.set_arrow_enabled(GameHud.arrows.left, false)

func spawn_node(node: Node2D) -> void:
	if paper_stand.is_item_available(node):
		paper_stand.place_item(node)
	add_child(node)

func _on_arrow_pressed(arrow: GameHud.arrows):
	togo_local(1 if arrow == GameHud.arrows.right else -1)

func togo_local(index: int):
	if !current_transition_sound:
		current_transition_sound = Sound.play_sound(SoundData.names.transition)
	current_local += index
	camera.to(locals[current_local])

func update_arrow_enabled():
	var left_total := current_local == 0
	var right_total := current_local == locals.size()-1
	
	game_hud.set_arrow_enabled(GameHud.arrows.right, !right_total)
	game_hud.set_arrow_enabled(GameHud.arrows.left, !left_total)

func freeze_all_craft_items_and_the_trash(craft_items_value: bool, trash_value: bool):
	craft_local.set_enable_craft_items(!craft_items_value)
	craft_local.set_enable_trash(!trash_value)

func _pop_mensage(mensage: PopUpMensage):
	if mensage is PopUpMensageOpenPopUp:
		factory_pop_up(mensage.pop_up_scene)
	elif mensage is PopUpMensageChangeScreen:
		change_screen.emit(mensage.screen_name)
	elif mensage is PopUpMensageChangeVisibility:
		call_deferred("_change_process_and_visibility", true, mensage.visibility)
	elif mensage is PopUpMensagePause:
		game_hud.visible = !mensage.pause
		GlobalTime.paused = mensage.pause
		set_deferred("paused", mensage.pause)
		call_deferred("_change_process_and_visibility", !mensage.pause, !mensage.pause)

func _change_process_and_visibility(process: bool, visibility_: bool):
	visibility = visibility_
	game_hud.visible = visibility
	for local in locals:
			local.process_mode = Node.PROCESS_MODE_INHERIT if process else Node.PROCESS_MODE_DISABLED
			local.visible = visibility

func _unhandled_input(event: InputEvent) -> void:
	if paused || !visibility:
		return
	
	if _handle_super_inputs(event):
		return
	elif _handle_mouse_wheel(event):
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
		
	return is_already_wheel

@warning_ignore("unused_parameter")
func _handle_super_inputs(event: InputEvent) -> bool:
	if Input.is_action_just_pressed("ui_cancel"):
		factory_pop_up(packed_menu_in_game.instantiate())
	else:
		return false
	return true

func _handle_inputs(event: InputEvent) -> void:
	if has_pop_up() || !event.is_pressed():
		return
	elif (Input.is_action_just_pressed("inp_toggle_local") || Input.is_action_just_pressed("inp_next_local")):
		togo_local(1)
	elif Input.is_action_just_pressed("inp_previous_local"):
		togo_local(-1)
