class_name SoundPlayer extends Node

var audio_stream_player: AudioStreamPlayer
var current_callable := func(): print("tá usando o default")
var loop_count := 1
var events: Array[SoundEvent]

var current_sound_name: SoundData.names
var current_sound_type

signal finished

func _init() -> void:
	audio_stream_player = AudioStreamPlayer.new()
	
	audio_stream_player.finished.connect(_on_finished)
	audio_stream_player.finished.connect(finished.emit)

func _on_finished():
	if loop_count < 0:
		audio_stream_player.play()
		return
		
	loop_count -= 1
	if loop_count < 1:
		return
	
	for event in events:
		event.reset()
	audio_stream_player.play()

func _process(delta: float) -> void:
	if audio_stream_player.playing:
		for event in events:
			event.process(delta)

func _ready() -> void:
	add_child(audio_stream_player)

func configure(sound_name: SoundData.names) -> void:
	current_sound_name = sound_name
	audio_stream_player.stream = SoundData.streams[current_sound_name]
	current_sound_type = SoundData.relation_name_type[current_sound_name]
	reset()

func update_volume(volumes: Dictionary[SoundData.types, float]):
	audio_stream_player.volume_linear = volumes[current_sound_type]

func play(callable: Callable=func(): return) -> void:
	if audio_stream_player.finished.is_connected(current_callable):
		audio_stream_player.finished.disconnect(current_callable)
		
	current_callable = callable
	audio_stream_player.finished.connect(current_callable)
	
	audio_stream_player.play()

func reset() -> void:
	events = []
	loop_count = 1
	audio_stream_player.pitch_scale = 1

func add_event(time_percentage: float, callable: Callable):
	var sound_size := audio_stream_player.stream.get_length()
	var sound_event := SoundEvent.new(sound_size*time_percentage, callable)
	events.push_back(sound_event)
