class_name SoundData extends Resource

enum names {
	ink_splash,
	stamping,
	transition,
	character_enter,
	shop_music
}

enum types {
	music,
	ambient,
	sound_effect
}

static var relation_name_type: Dictionary[names, types] = {
	names.ink_splash: types.sound_effect,
	names.stamping: types.sound_effect,
	names.transition: types.ambient,
	names.character_enter: types.ambient,
	names.shop_music: types.music
}

static var streams: Dictionary[names, AudioStreamMP3] = {
	names.ink_splash: preload("res://assets/sounds/ink_splash.mp3"),
	names.stamping: preload("res://assets/sounds/stamping.mp3"),
	names.transition: preload("res://assets/sounds/transition.mp3"),
	names.character_enter: preload("res://assets/sounds/character_enter.mp3"),
	names.shop_music: preload("res://assets/music/SHOP.mp3")
}
