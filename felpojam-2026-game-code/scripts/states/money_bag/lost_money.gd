extends State

var host: MoneyBag

func enter(host_) -> void:
	host = host_
	
	var longer_duration: float
	var coin_count := max(int(host.money_diference), 1)*4 as int
	for i in coin_count:
		var coin := host.packed_coin.instantiate() as Sprite2D
		coin.modulate = Color(1.0, 0.0, 0.0, 1.0)
		host.add_child(coin)
		
		var to := Random.get_random_vector2_in_interval(Vector2(10, 0)) + Vector2(0, -50)
		var enter_duration = randf_range(0.15, 0.3)
		var exit_duration = randf_range(0.2, 0.4)
		var tween := get_tree().create_tween()
		tween.tween_property(coin, "position", to, enter_duration).set_ease(Tween.EASE_OUT)
		tween.tween_property(coin, "position", Vector2(to.x, 100), exit_duration).set_ease(Tween.EASE_OUT)
		tween.tween_callback(coin.queue_free)
	get_tree().create_timer(longer_duration).timeout.connect(host.update_sprite)
