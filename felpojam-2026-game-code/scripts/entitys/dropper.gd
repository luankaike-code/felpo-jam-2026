class_name Dropper extends Draggable

var packed_dropper_stand = preload("res://scenes/entitys/dropper_stand.tscn") as PackedScene
var current_rune: Rune

func _ready() -> void:
	super()
	
	var dropper_stand := packed_dropper_stand.instantiate() as DropperStand
	dropper_stand.setup(self)
	dropper_stand.position = position
	default_stand = dropper_stand
	call_deferred("spawn_stand")
	
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _finish_drag() -> void:	
	if current_rune:
		current_rune.level_up()

	if current_stand:
		current_stand.place_item(self)

func spawn_stand():
	spawn_node.emit(default_stand)

func _on_area_entered(body: Area2D) -> void:
	if body is Rune:
		current_rune = body

func _get_overlapping_rune() -> Rune:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Rune:
			return area
	return

func _on_area_exited(body: Area2D) -> void:
	if body is Rune:
		var rune = _get_overlapping_rune()
		current_rune = rune if rune else null
		
		
