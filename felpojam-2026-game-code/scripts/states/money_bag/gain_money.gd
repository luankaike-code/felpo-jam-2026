extends State

var host: MoneyBag

func enter(host_) -> void:
	host = host_
	
	var longer_duration: float
	var coin_count := max(int(host.money_diference), 1)*4 as int
	for i in coin_count:
		var coin := host.packed_coin.instantiate() as Sprite2D
		host.add_child(coin)
		
		var to := Random.get_random_vector2_in_interval(Vector2(30, 0)) + Vector2(0, -50)
		coin.position = to
		var duration = randf_range(0.15, 0.3)
		if duration > longer_duration:
			longer_duration = duration
		var tween := get_tree().create_tween()
		tween.tween_property(coin, "position", Vector2.ZERO, duration).set_ease(Tween.EASE_OUT)
		tween.tween_callback(coin.queue_free)
	get_tree().create_timer(longer_duration).timeout.connect(host.update_sprite)
