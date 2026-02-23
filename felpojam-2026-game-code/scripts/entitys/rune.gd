class_name Rune extends Area2D

@export var rune_name: RunesData.names 
@onready var sprite := $Sprite2D as Sprite2D
@onready var particle_rune: ParticleRune = $ParticleRune

var link: Rune
var data: RuneObj

func _ready() -> void:
	data = RuneObj.new(rune_name, 1)
	particle_rune.set_radius(30)
	sprite.texture = RunesData.textures[rune_name]
	area_entered.connect(liked_other_rune)

func liked_other_rune(area: Area2D):
	if !area is Rune || area.get_parent() != get_parent():
		return
	if area.data.rune == data.rune || (area.link && area.link != self) || link:
		return
	
	link = area
	if !link.link:
		link.liked_other_rune(self)

	move_to_link()

func level_up():
	data.level += 1
	particle_rune.set_emitting(true)
	modulate = Color(0.15*data.level, 0.83, 0.773, 1.0)

func move_to_link():
	var half_distance = (link.position - position) / 2
	var to = position + half_distance
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", to, 0.2)
