class_name DropperStand extends Stand

var normal_texture := preload("res://assets/images/stand_dropper.png") as CompressedTexture2D
var texture_with_dropper := preload("res://assets/images/stand_dropper_with_item.png") as CompressedTexture2D

@onready var sprite: Sprite2D = $Sprite

var dropper: Dropper
var has_dropper := true :
	set(new):
		has_dropper = new
		update_sprite()

func _ready() -> void:
	super()
	
	update_sprite()

func setup(dropper_: Dropper) -> void:
	dropper = dropper_

func place_item(item: Node2D) -> bool:
	var cond := is_item_available(item)
	
	if cond:
		item.global_position = global_position
		has_dropper = true
		
	return cond

func is_item_available(item: Node2D) -> bool:
	return item == dropper

func update_sprite() -> void:
	sprite.texture = texture_with_dropper if has_dropper else normal_texture
