class_name StampData extends Resource

enum versions {
	normal,
	in_stand
}

static var stamp_textures: Dictionary[RunesData.names, StampTextureObj] = {
	RunesData.names.dark: StampTextureObj.new(
		preload("res://assets/images/stamps.png"), 
		preload("res://assets/images/stamps_into_stand.png"),
		0
	),
	RunesData.names.fire: StampTextureObj.new(
		preload("res://assets/images/stamps.png"), 
		preload("res://assets/images/stamps_into_stand.png"),
		1
	),
	RunesData.names.water: StampTextureObj.new(
		preload("res://assets/images/stamps.png"), 
		preload("res://assets/images/stamps_into_stand.png"),
		2
	),
	RunesData.names.earth: StampTextureObj.new(
		preload("res://assets/images/stamps.png"), 
		preload("res://assets/images/stamps_into_stand.png"),
		3
	),
	RunesData.names.air: StampTextureObj.new(
		preload("res://assets/images/stamps.png"), 
		preload("res://assets/images/stamps_into_stand.png"),
		4
	),
	RunesData.names.light: StampTextureObj.new(
		preload("res://assets/images/stamps.png"), 
		preload("res://assets/images/stamps_into_stand.png"),
		5
	),
}

static var super_stamp_textures: Dictionary[RunesData.names, CompressedTexture2D] = {
	RunesData.names.chaos: preload("res://assets/images/chaos_stamp.png"),
	RunesData.names.order: preload("res://assets/images/chaos_stamp.png"),
}
