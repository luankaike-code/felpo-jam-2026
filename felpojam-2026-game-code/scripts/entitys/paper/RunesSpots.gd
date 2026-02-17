class_name RunesSpots extends Node2D

var spots: Array[Spot]

func add_spot(rune_name: RunesData.names, pos: Vector2):
	var spot = Spot.new(rune_name, pos)
	spots.push_front(spot)
	queue_redraw()

func _draw() -> void:
	for spot in spots:
		var c := spot.color
		draw_circle(spot.pos, 60, Color(c.r, c.g, c.b, 0.3))
