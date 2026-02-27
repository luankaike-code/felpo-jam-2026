class_name SpeechBubble extends MarginContainer

@warning_ignore("unused_signal")
signal finish_all_dialogs
@warning_ignore("unused_signal")
signal all_delivery_zones_filled(parchments: Array[ParchmentObj])

@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var delivery_zone_conteiner: HBoxContainer = $MarginContainer/VBoxContainer/DeliveryZoneConteiner
@onready var state_machine := $StateMachine as StateMachine

@export var dialogs: Array
@export var delivery_zone_count: int

var current_dialog_index: int
var typing_velocity := 0.1
var min_width := 200

func _ready() -> void:
	label.custom_minimum_size = Vector2(min_width, 0)
	state_machine.change_state("Typing")

func setup(dialogs_: Array,delivery_zone_count_: int):
	dialogs = dialogs_
	delivery_zone_count = delivery_zone_count_

func destroy():
	for dz in delivery_zone_conteiner.get_children():
		if dz is DeliveryZoneInterface:
			dz.destroy()
	queue_free()
