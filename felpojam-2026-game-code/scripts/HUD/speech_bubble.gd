class_name SpeechBubble extends MarginContainer

signal finish_all_dialogs

@onready var label := $MarginContainer/Label as Label
@onready var state_machine := $StateMachine as StateMachine

@export var dialogs: Array

var current_dialog_index: int
var typing_velocity := 0.1

func _ready() -> void:
	state_machine.change_state("Typing")

func setup(dialogs_: Array, pos: Vector2):
	dialogs = dialogs_
	global_position = pos
