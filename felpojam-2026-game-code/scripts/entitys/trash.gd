extends Stand

func place_item(item: Node2D):
	if item is Paper:
		item.queue_free()
