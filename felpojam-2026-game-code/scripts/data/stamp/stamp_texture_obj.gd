class_name StampTextureObj extends Node


var normal_texture: CompressedTexture2D
var texture_into_stand: CompressedTexture2D
var frame: int

func _init(normal_texture_: CompressedTexture2D, texture_into_stand_: CompressedTexture2D, frame_: int) -> void:
	normal_texture = normal_texture_
	texture_into_stand = texture_into_stand_
	frame = frame_
