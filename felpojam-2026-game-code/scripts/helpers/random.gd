class_name Random extends Resource

static func get_random_vector2(value_max: Vector2, value_min := Vector2.ZERO) -> Vector2:
	var x := randf_range(value_min.x, value_max.x)
	var y := randf_range(value_min.y, value_max.y)
	
	return Vector2(x, y)

static func get_random_vector2_in_interval(interval: Vector2) -> Vector2:
	return get_random_vector2(interval, -interval)
