extends Node

var max_players := 10
var players: Array[SoundPlayer]

var volumes: Dictionary[SoundData.types, float] = {
	SoundData.types.music: 1.0,
	SoundData.types.ambient: 1.0,
	SoundData.types.sound_effect: 1.0,
}

func set_volume(sound_type: SoundData.types, new_volume: float) -> void:
	volumes[sound_type] = new_volume

func play_sound(audio_name: SoundData.names, callable: Callable=func(): return) -> void:
	var player := _configure_player(_get_player(), audio_name)
	player.play(callable)

func _configure_player(player: SoundPlayer, audio_name: SoundData.names) -> SoundPlayer:
	player.audio_stream_player.stream = SoundData.streams[audio_name]
	var type := SoundData.relation_name_type[audio_name]
	player.audio_stream_player.volume_linear = volumes[type]
	return player

func _get_player() -> SoundPlayer:	
	if players.size() < max_players:
		return _create_player()
	
	for player in players:
		if !player.playing:
			return player

	return _create_temp_player()

func _create_temp_player() -> SoundPlayer:
	var player := SoundPlayer.new()
	player.finished.connect(func(): player.call_deferred("queue_free"))
	add_child(player)
	return player

func _create_player() -> SoundPlayer:
	var player = SoundPlayer.new()
	players.push_front(player)
	add_child(player)
	return player
