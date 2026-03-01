class_name Trash extends Stand

var packed_crumpled_paper := preload("res://scenes/entitys/crumpled_paper.tscn") as PackedScene
@onready var particle_trash: Particle = $ParticleTrash

var enable := true

func _ready() -> void:
	super()
	
	description = DescriptionsData.descriptions[DescriptionsData.names.trash]

func place_item(item: Node2D) -> bool:
	var cond := is_item_available(item)
	
	if cond:
		_knead_paper_to_trash_animation_play(Vector2.ZERO, !!item.runes)
		item.queue_free()
		
	return cond

func _knead_paper_to_trash_animation_play(pos: Vector2, has_rune: bool):
	var crumpled_paper := _create_and_config_crumpled_paper(pos, has_rune)
	var tween := get_tree().create_tween()
	
	tween.tween_property(crumpled_paper, "position", crumpled_paper.position+Vector2(0, -70), 0.2)
	tween.tween_property(crumpled_paper, "position", crumpled_paper.position+Vector2(0, -70), 0.2)
	tween.tween_property(crumpled_paper, "position", crumpled_paper.position+Vector2(0, 0), 0.2)
	tween.tween_callback(crumpled_paper.queue_free)
	#tween.tween_callback(func(): particle_trash.set_emitting(true))
	
func _create_and_config_crumpled_paper(pos: Vector2, has_rune: bool) -> CrumpledPaper:
	var crumpled_paper := packed_crumpled_paper.instantiate() as CrumpledPaper
	crumpled_paper.position = pos
	
	var version = CrumpledPaper.versions.with_ink if has_rune else CrumpledPaper.versions.normal
	crumpled_paper.setup(version)
	
	add_child(crumpled_paper)
	return crumpled_paper
	

func is_item_available(item: Node2D) -> bool:
	return item is Paper
