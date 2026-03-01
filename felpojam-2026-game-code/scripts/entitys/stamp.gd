class_name Stamp extends Draggable

@onready var sprite := $Sprite as Sprite2D
@onready var state_machine := $StateMachine as StateMachine

@export var rune_name: RunesData.names

var packed_stand_stamp := preload("res://scenes/entitys/stamp_stand.tscn") as PackedScene

var current_paper: Paper
var has_ink := false :
	set(new):
		has_ink = new
		modulate = Color(1.0, 1.0, 0.0, 1.0) if has_ink else Color(1.0, 1.0, 1.0, 1.0)
var texture_data: StampTextureObj

func _ready() -> void:
	super()
	
	var base_description := DescriptionsData.descriptions[DescriptionsData.names.stamp]
	description = base_description % [RunesData.string[rune_name]]
	_set_sprite()
	_make_stamp_connections()
	
	call_deferred("spaw_stand")

func _set_sprite():
	sprite.hframes = StampData.textures.size()
	texture_data = StampData.textures[rune_name]
	change_sprite_texture(StampData.versions.in_stand)

func _make_stamp_connections():
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)
	state_machine.change_state("Idle")

func spaw_stand():
	var stand := packed_stand_stamp.instantiate() as StampStand
	stand.setup(self)
	stand.position = position
	default_stand = stand
	spawn_node.emit(default_stand)

func _finish_drag() -> void:	
	state_machine.change_state("Dropping")

func _start_drag():
	change_sprite_texture(StampData.versions.normal)

func on_area_entered(body: Area2D) -> void:
	if body is Paper:
		if current_paper && current_paper.z_index > body.z_index:
			return
		current_paper = body

func get_overlapping_paper() -> Paper:
	var areas := get_overlapping_areas()
	for area in areas:
		if area is Paper:
			return area
	return

func on_area_exited(body: Area2D) -> void:
	if body is Paper:
		var paper = get_overlapping_paper()
		current_paper = paper if paper else null

func change_sprite_texture(version: StampData.versions) -> void:
	var texture = texture_data.normal_texture if version == StampData.versions.normal else texture_data.texture_into_stand
	sprite.texture = texture
	sprite.frame = texture_data.frame
