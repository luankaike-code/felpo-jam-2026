class_name SoundData extends Resource

enum names {
	close_door,
	open_door,
	steps,
	transition,
	
	shop_music,
	
	dropper_1,
	dropper_2,
	gain_money,
	little_bell,
	paper_1,
	paper_2,
	paper_3,
	stamp_ink,
	stamp_stand,
}

enum types {
	ambient,
	music,
	sound_effect
}

static var relation_name_type: Dictionary[names, types] = {
	names.close_door: types.ambient,
	names.open_door: types.ambient,
	names.steps: types.ambient,
	names.transition: types.ambient,
	
	names.shop_music: types.music,
	
	names.dropper_1: types.sound_effect,
	names.dropper_2: types.sound_effect,
	names.gain_money: types.sound_effect,
	names.little_bell: types.sound_effect,
	names.paper_1: types.sound_effect,
	names.paper_2: types.sound_effect,
	names.paper_3: types.sound_effect,
	names.stamp_ink: types.sound_effect,
	names.stamp_stand: types.sound_effect,
}

static var streams: Dictionary[names, AudioStreamMP3] = {
	names.close_door: preload("res://assets/ambient_sounds/close_door.mp3"),
	names.open_door: preload("res://assets/ambient_sounds/open_door.mp3"),
	names.steps: preload("res://assets/ambient_sounds/steps.mp3"),
	names.transition: preload("res://assets/ambient_sounds/transition.mp3"),
	
	names.shop_music: preload("res://assets/music/shop_music.mp3"),
	
	names.dropper_1: preload("res://assets/sounds_effects/dropper_1.mp3"),
	names.dropper_2: preload("res://assets/sounds_effects/dropper_2.mp3"),
	names.gain_money: preload("res://assets/sounds_effects/gain_money.mp3"),
	names.little_bell: preload("res://assets/sounds_effects/little_bell.mp3"),
	names.paper_1: preload("res://assets/sounds_effects/paper_1.mp3"),
	names.paper_2: preload("res://assets/sounds_effects/paper_2.mp3"),
	names.paper_3: preload("res://assets/sounds_effects/paper_3.mp3"),
	names.stamp_ink: preload("res://assets/sounds_effects/stamp_ink.mp3"),
	names.stamp_stand: preload("res://assets/sounds_effects/stamp_stand.mp3"),
}
