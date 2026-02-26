class_name MusicManager extends Node

var music_player: SoundPlayer
var current_music_name:  SoundData.names
var enter_transition_music_duration := 0.5
var exit_transition_music_duration := 1.0

func play_music(music_name: SoundData.names):
	if music_player && music_name == music_player.current_sound_name:
		return
	
	current_music_name = music_name
	if music_player:
		var tween := get_tree().create_tween()
		tween.tween_property(music_player, "relative_volume", 0.0, enter_transition_music_duration)
		tween.tween_callback(_play_current_music)
	else:
		_play_current_music()
	
func _play_current_music():
	if music_player:
		music_player.reset()
	
	music_player = Sound.play_sound(current_music_name)
	music_player.loop_count = -1
	
	music_player.relative_volume = 0.0
	var tween := get_tree().create_tween()
	tween.tween_property(music_player, "relative_volume", 1.0, exit_transition_music_duration)
