extends VBoxContainer

@onready var ambient_volume: HSlider = $MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/Control/Ambient
@onready var sound_effects_volume: HSlider = $MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer2/Control/SoundEffects
@onready var music_volume: HSlider = $MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer3/Control/Music

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
	ambient_volume.value_changed.connect(func (x): 
		change_type_volume(SoundData.types.music, x)
	)

func change_type_volume(type: SoundData.types, new_volume: float) -> void:
	Sound.volumes[type] = new_volume
