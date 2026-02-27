class_name Dropper extends Draggable

var packed_dropper_stand := preload("res://scenes/entitys/dropper_stand.tscn") as PackedScene
var normal_texture := preload("res://assets/images/dropper_item_animation.png")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var state_machine: StateMachine = $StateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var current_rune: Rune
var current_paper: Paper

var into_stand := true :
	set(new):
		into_stand = new
		update_sprite()

func _ready() -> void:
	super()
	
	description = DescriptionsData.descriptions[DescriptionsData.names.dropper]
	animation_player.animation_finished.connect(_reset_sprite_frame)
	
	var dropper_stand := packed_dropper_stand.instantiate() as DropperStand
	dropper_stand.setup(self)
	dropper_stand.position = position
	default_stand = dropper_stand
	call_deferred("spawn_stand")
	
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	update_sprite()

@warning_ignore("unused_parameter")
func _reset_sprite_frame(anim_name: String):
	sprite_2d.frame = 0
	sprite_2d.position = Vector2(0.0, 14.0)

func update_sprite():
	sprite_2d.texture = null if into_stand else normal_texture

func _finish_drag() -> void:
	state_machine.change_state("FinishDrag")

func _start_drag():
	into_stand = false
	if current_stand is DropperStand:
		current_stand.has_dropper = false

func spawn_stand():
	spawn_node.emit(default_stand)

func _get_overlapping_rune() -> Rune:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Rune:
			return area
	return

func _get_overlapping_paper() -> Paper:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Paper:
			return area
	return

func _on_area_entered(body: Area2D) -> void:		
	if body is Rune:
		current_rune = body if body.data.level < 1  else current_rune
	elif body is Paper:
		current_paper = body if current_rune in body.runes || !current_rune else current_paper

func _on_area_exited(body: Area2D) -> void:
	if body is Rune:
		var rune := _get_overlapping_rune()
		current_rune = rune
	elif body is Paper:
		var paper := _get_overlapping_paper()
		current_paper = paper
