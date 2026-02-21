class_name ClientLocal extends Node2D

@onready var character_sprite := $CharacterSprite as CharacterSprite
@onready var speech_bubble_manager := $SpeechBubbleManager as SpeechBubbleManager
@onready var state_machine := $StateMachine as StateMachine
@onready var delivery_bubble := $DeliveryBubble as DeliveryBubble

var current_client_order_index: int
var current_character_name: CharacterData.names
var current_speech_name: SpeechsData.names
var client: ClientObj

func _ready() -> void:
	delivery_bubble.add_delivery_zone()
	delivery_bubble.add_delivery_zone()

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_copy"):
		if state_machine.current_state.name == "ExitClient":
			state_machine.change_state("NewClient")
