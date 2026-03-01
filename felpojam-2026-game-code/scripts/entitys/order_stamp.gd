extends Stamp

func _ready() -> void:
	rune_name = RunesData.names.order
	super()
	
	var base_description := DescriptionsData.descriptions[DescriptionsData.names.super_stamp]
	description = base_description % ["da ordem"]

func _set_sprite() -> void:
	pass

func change_sprite_texture(version: StampData.versions) -> void:
	pass
