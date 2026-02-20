class_name SoundPlayer extends Node

var audio_stream_player: AudioStreamPlayer
var current_callable := func(): print("tá usando o default")

signal finished

func _init() -> void:
	audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.finished.connect(finished.emit)

func _ready() -> void:
	add_child(audio_stream_player)

func play(callable: Callable=func(): return) -> void:
	if audio_stream_player.finished.is_connected(current_callable):
		audio_stream_player.finished.disconnect(current_callable)
		
	current_callable = callable
	audio_stream_player.finished.connect(current_callable)
	
	audio_stream_player.play()
