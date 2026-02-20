class_name CurrentLocal extends Node2D

@onready var character_sprite := $CharacterSprite as CharacterSprite
@onready var speech_bubble_manager := $SpeechBubbleManager as SpeechBubbleManager
@onready var state_machine: StateMachine = $StateMachine

var current_client_order_index: int
var current_character_name: CharacterData.names
var current_speech_name: SpeechsData.names

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_copy"):
		state_machine.change_state("NewClient")

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
