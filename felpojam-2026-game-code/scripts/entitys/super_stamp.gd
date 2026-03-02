class_name NewSuperStamp extends StampBase

enum super_runes {
	order,
	chaos,
}

@export var super_rune_name: super_runes

func _ready() -> void:
	super()
	
	rune_name = RunesData.names.order if super_rune_name == super_runes.order else RunesData.names.chaos 
	var base_description := DescriptionsData.descriptions[DescriptionsData.names.super_stamp]
	description = base_description % RunesData.string[rune_name]
	sprite.texture = StampData.super_stamp_textures[rune_name]
	modulate = Color.WHITE
