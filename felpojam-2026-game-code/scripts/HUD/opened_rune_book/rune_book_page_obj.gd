class_name RuneBookPageObj extends Node

var page_title: String
var description: String
var image: Texture

func _init(page_title_: String, description_: String, image_: Texture=null) -> void:
	page_title = page_title_
	description = description_
	image = image_
