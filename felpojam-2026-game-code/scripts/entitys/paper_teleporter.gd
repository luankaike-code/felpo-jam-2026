class_name PaperTeleporter extends Stand

@export var linked_teleporter: PaperTeleporter

var teleported_paper: Paper

func _ready() -> void:
	area_exited.connect(deslinked_teleported_paper)

func deslinked_teleported_paper(area: Area2D):
	if area == teleported_paper:
		teleported_paper = null

func teleporter_paper(paper: Paper):
	teleported_paper = paper
	paper.global_position = global_position

func place_item(item: Node2D) -> bool:
	if item is Paper and linked_teleporter and item != teleported_paper:
		linked_teleporter.teleporter_paper(item)
		return true
	return false
