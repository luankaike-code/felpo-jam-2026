class_name ClientLocal extends Local

@onready var character_sprite_pos: Node2D = $CharacterSpritePos
@onready var speech_bubble_manager := $SpeechBubbleManager as SpeechBubbleManager
@onready var state_machine := $StateMachine as StateMachine

var current_client_order_index: int
var current_client_data: ClientObj
var character_sprite: CharacterSprite

var current_order: OrderObj

@warning_ignore("unused_signal")
signal client_wait_order
@warning_ignore("unused_signal")
signal exit_client

func new_client():
	var client_name := ClientData.order[current_client_order_index]
	current_client_data = ClientData.client[client_name]
	
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

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_copy"):
		if state_machine.current_state.name == "Idle":
			new_client()
