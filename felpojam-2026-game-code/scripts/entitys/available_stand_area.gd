extends Stand

var data: Dictionary[int, Vector2]

func place_item(item: Node2D) -> bool:
	var cond := is_item_available(item)
	
	if cond:
		data.get_or_add(item.get_instance_id(), item.position)
		item.default_stand = self
		
		var into_collision := is_paper_into_collision(item)

		if !into_collision:
			item.position = data.get(item.get_instance_id())
		else:
			data[item.get_instance_id()] = item.position
		
	return cond

func is_paper_into_collision(paper: Paper) -> bool:
	var ids = get_shape_owners()
	var into_collision := false
	
	for id in ids:
		var collision: CollisionShape2D = shape_owner_get_owner(id)
		if collision.disabled:
			continue
		var rect_local := collision.shape.get_rect()
		into_collision = rect_local.has_point(to_local(paper.global_position))
		print(id, " ", rect_local, " ", to_local(paper.global_position), " ", into_collision)
		if into_collision:
			break
	
	return into_collision
	

func is_item_available(item: Node2D) -> bool:
	return item is Paper
