class_name Dropper extends Draggable

var packed_dropper_stand = preload("res://scenes/entitys/dropper_stand.tscn") as PackedScene

func _ready() -> void:
	super()
	
	var dropper_stand := packed_dropper_stand.instantiate() as DropperStand
	dropper_stand.setup(self)
	dropper_stand.position = position
	default_stand = dropper_stand
	call_deferred("spawn_stand")

func spawn_stand():
	spawn_node.emit(default_stand)
