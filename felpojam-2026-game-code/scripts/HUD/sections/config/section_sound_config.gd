extends VBoxContainer

@onready var ambient_volume := $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/Control/Ambient as HSlider
@onready var sound_effects_volume := $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/Control/SoundEffects as HSlider
@onready var music_volume := $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer3/Control/Music as HSlider

var relation_slider_sound_type: Dictionary[SoundData.types, HSlider] = {
	SoundData.types.ambient: ambient_volume,
	SoundData.types.sound_effect: sound_effects_volume,
	SoundData.types.music: music_volume
}

func _ready() -> void:
	set_default_value()	
	connect_signals()

func set_default_value():
	ambient_volume.value = Sound.volumes[SoundData.types.ambient]
	sound_effects_volume.value = Sound.volumes[SoundData.types.sound_effect]
	music_volume.value = Sound.volumes[SoundData.types.music]

func connect_signals() -> void:
	ambient_volume.value_changed.connect(func (x): 
		change_type_volume(SoundData.types.ambient, x)
	)
	sound_effects_volume.value_changed.connect(func (x): 
		change_type_volume(SoundData.types.sound_effect, x)
	)
	music_volume.value_changed.connect(func (x): 
		change_type_volume(SoundData.types.music, x)
	)

func change_type_volume(type: SoundData.types, new_volume: float) -> void:
	Sound.volumes[type] = new_volume
