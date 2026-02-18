extends Node

var max_players := 10
var players: Array[AudioStreamPlayer]

var volumes: Dictionary[SoundData.types, float] = {
	SoundData.types.music: 1.0,
	SoundData.types.ambient: 1.0,
	SoundData.types.sound_effect: 1.0,
}

func set_volume(sound_type: SoundData.types, new_volume: float) -> void:
	volumes[sound_type] = new_volume

func play_sound(audio_name: SoundData.names):
	var player = _configure_player(_get_player(), audio_name)
	player.play()

func _configure_player(player: AudioStreamPlayer, audio_name: SoundData.names) -> AudioStreamPlayer:
	player.stream = SoundData.streams[audio_name]
	var type := SoundData.relation_name_type[audio_name]
	player.volume_linear = volumes[type]
	return player

func _get_player() -> AudioStreamPlayer:	
	if players.size() < max_players:
		return _create_player()
	
	for player in players:
		if !player.playing:
			return player

	return _create_temp_player()

func _create_temp_player() -> AudioStreamPlayer:
	var player := AudioStreamPlayer.new()
	player.finished.connect(func(): player.call_deferred("queue_free"))
	add_child(player)
	return player

func _create_player() -> AudioStreamPlayer:
	var player = AudioStreamPlayer.new()
	players.push_front(player)
	add_child(player)
	return player
