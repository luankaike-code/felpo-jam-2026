class_name MoneyBag extends Node2D

@onready var state_machine: StateMachine = $StateMachine
@onready var sprite_2d: Sprite2D = $Sprite2D

var packed_coin := preload("res://scenes/entitys/coin.tscn")

var money_diference: float

func _ready() -> void:
	Global.money_changed.connect(_on_change_money)

func _on_change_money(diference: float):
	if diference == 0:
		return
		
	money_diference = diference
	
	if diference > 0:
		state_machine.change_state("GainMoney")
	if diference < 0:
		state_machine.change_state("LostMoney")

func update_sprite():
	sprite_2d.frame = 0 if Global.money > 20 else 1
