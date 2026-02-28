class_name Local extends Node2D

@export var bg_texture: CompressedTexture2D = preload("res://assets/images/bg_teste.png")
@onready var bg: Sprite2D = $Bg

@warning_ignore("unused_signal")
signal open_pop_up(pop_up_scene: PopUp)

func _ready() -> void:
	for child in get_children():
		if child is Draggable:
			child.spawn_node.connect(add_child)
	bg.texture = bg_texture if !bg.texture else bg.texture
