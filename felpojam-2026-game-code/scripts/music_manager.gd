class_name MusicManager extends Node

var music_player: SoundPlayer

func play_music(music_name: SoundData.names):
	if music_player && music_name == music_player.current_sound_name:
		return
		
	if music_player:
		music_player.reset()
		
	music_player = Sound.play_sound(music_name)
	music_player.loop_count = -1
