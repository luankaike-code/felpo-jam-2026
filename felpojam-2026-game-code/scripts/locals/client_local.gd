class_name ClientLocal extends Local

@onready var character_sprite_pos: Node2D = $CharacterSpritePos
@onready var speech_bubble_manager := $SpeechBubbleManager as SpeechBubbleManager
@onready var state_machine := $StateMachine as StateMachine
@onready var table_bell: TableBell = $TableBell

var current_client_order_index: int
var current_client_name: ClientData.names
var current_client_data: ClientObj
var character_sprite: CharacterSprite

var current_order: OrderObj

@warning_ignore("unused_signal")
signal add_dick(dick_text: String)
@warning_ignore("unused_signal")
signal remove_dick()

@warning_ignore("unused_signal")
signal craft_time
@warning_ignore("unused_signal")
signal client_wait_order
@warning_ignore("unused_signal")
signal exit_client
@warning_ignore("unused_signal")
signal receive_total_parchments

func _ready() -> void:
	table_bell.pressed.connect(new_client)

func new_client():
	if state_machine.current_state.name != "Idle":
		return

	current_client_name = ClientData.order[current_client_order_index]
	current_client_data = ClientData.client[current_client_name]
	
	state_machine.change_state("NewClient")

func add_character_sprite(character_name: CharacterData.names):
	var packed_character_sprite := CharacterData.packeds[character_name]
	character_sprite = packed_character_sprite.instantiate()
	
	character_sprite.position = character_sprite_pos.position
	character_sprite.z_index = character_sprite_pos.z_index
	add_child(character_sprite)
	
	speech_bubble_manager.global_position = character_sprite.get_bubble_position()

func enter_character():
	Sound.play_sound(SoundData.names.open_door, func():
		Sound.play_sound(SoundData.names.close_door)
		Sound.play_sound(SoundData.names.little_bell).add_event(0.2, character_sprite.enter)
	)
	
func exit_character():
	character_sprite.exit()
	Sound.play_sound(SoundData.names.open_door, func():
		Sound.play_sound(SoundData.names.close_door)
		Sound.play_sound(SoundData.names.little_bell)
	)

func handle_client_result_mensage(client_result: ClientResult):
	print(client_result.mensage, client_result.mensage is ClientResultMensageMoney)
	if client_result.mensage is ClientResultMensageMoney:
		Global.money += client_result.mensage.money
	elif client_result.mensage is ClientResultMensageOpenPop:
		open_pop_up.emit(client_result.mensage.pop_up)
	else:
		assert(false, "%s Not is handle. ClientResult(%s, %s)" % [str(client_result), str(client_result.speech), str(client_result.mensage)])
