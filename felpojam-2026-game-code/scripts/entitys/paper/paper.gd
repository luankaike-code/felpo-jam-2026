class_name Paper extends Draggable

@onready var state_machine := $StateMachine as StateMachine
@onready var sprite: Sprite2D = $Sprite

var packed_rune := preload("res://scenes/entitys/rune.tscn") as PackedScene

var runes: Array[Rune]

var data: ParchmentObj :
	get():
		var rune_objs: Array[RuneObj]
		for rune in runes:
			rune_objs.push_back(rune.data)
		return ParchmentObj.new(rune_objs)

signal rune_added(paper: Paper)

func _ready() -> void:
	super()
	
	start_drag.connect(play_paper_drag_sound)

func play_paper_drag_sound():
	var variants := [SoundData.names.paper_1, SoundData.names.paper_2, SoundData.names.paper_3]
	Sound.play_sound(variants.pick_random())

func add_rune(rune_name: RunesData.names, rune_global_position: Vector2) -> bool:
	var rune_scene := packed_rune.instantiate() as Rune
	rune_scene.setup(rune_name)
	rune_scene.position = to_local(rune_global_position)
	sprite.add_child(rune_scene)
	runes.push_front(rune_scene)
	rune_added.emit(self)
	return true

func _finish_drag():
	if current_stand:
		var result = current_stand.place_item(self)
		if current_stand is DeliveryZone && !result:
			Sound.play_sound(SoundData.names.error)
			state_machine.change_state("AnimationShaking")

