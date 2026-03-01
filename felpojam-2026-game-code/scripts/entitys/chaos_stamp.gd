extends Stamp

func _ready() -> void:
	rune_name = RunesData.names.chaos
	super()
	
	var base_description := DescriptionsData.descriptions[DescriptionsData.names.super_stamp]
	description = base_description % ["do caos"]

func _set_sprite() -> void:
	pass

func change_sprite_texture(version: StampData.versions) -> void:
	pass
