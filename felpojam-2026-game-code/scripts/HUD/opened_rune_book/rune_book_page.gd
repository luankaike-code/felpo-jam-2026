class_name RuneBookPage extends VBoxContainer

@onready var title: Label = $Title
@onready var image: TextureRect = $Image
@onready var description: Label = $Description
@onready var page_number: Label = $PageNumber
@onready var rune_book_items: RuneBookItems = $RuneBookItems

@export var h_flip := false

func setup(page_obj: RuneBookPageObj, items_obj: RuneBookItemsObj, page_num: int) -> void:
	title.text = page_obj.page_title
	
	image.texture = page_obj.image
	
	description.text = page_obj.description
	
	page_number.text = str(page_num)
	page_number.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT if h_flip else HORIZONTAL_ALIGNMENT_RIGHT
	
	rune_book_items.material = material
	rune_book_items.setup(items_obj)
