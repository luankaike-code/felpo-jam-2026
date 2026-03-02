class_name Stamp extends StampBase

@export var _rune_name: RunesData.names

var texture_data: StampTextureObj

func _ready() -> void:
	super()
	
	rune_name = _rune_name
	var base_description := DescriptionsData.descriptions[DescriptionsData.names.stamp]
	description = base_description % [RunesData.string[rune_name]]
	_set_sprite()

func _set_sprite():
	sprite.hframes = StampData.stamp_textures.size()
	texture_data = StampData.stamp_textures[rune_name]
	change_sprite_texture(StampData.versions.in_stand)

func change_sprite_texture(version: StampData.versions) -> void:
	var texture = texture_data.normal_texture if version == StampData.versions.normal else texture_data.texture_into_stand
	sprite.texture = texture
	sprite.frame = texture_data.frame
