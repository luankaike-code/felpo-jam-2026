class_name OpenedRuneBook extends Control

const PAGE_IMG_1 = preload("uid://d6fk55x7yfsm")

const TEXTURE_ONE_PAGE = preload("uid://x825aqrw2ck3")
const TEXTURE_TWO_PAGE = preload("uid://wmplskn0msed")

@export var start_page := 0 :
	set(new):
		start_page = new
		assert(start_page%2 == 0, "start_page is not a even number")

@onready var rune_book_page_left: RuneBookPage = $BookTexture/HBoxContainer/Page1/RuneBookPageLeft
@onready var rune_book_page_right: RuneBookPage = $BookTexture/HBoxContainer/Page2/RuneBookPageRight
@onready var book_texture: TextureRect = $BookTexture

signal pass_page

var current_index := 0 :
	set(new):
		if current_index != new:
			pass_page.emit()
		current_index = new

func get_right_page_number() -> int:
	return start_page + current_index

func get_left_page_number()  -> int:
	return -1 if current_index == 0 else start_page + current_index-1

func togo_page(to: int) -> void:
	to = clampi(to, -1, 1) * 2
	current_index = clampi(current_index+to, 0, ParchmentData.parchments_arr.size()-1)
	update_pages()
	
func update_pages() -> void:	
	var parchment := ParchmentData.parchments_arr[current_index]
	var parchment_name := ParchmentData.parchments_names[parchment]
	var parchment_obj := ParchmentData.parchments[parchment]
	
	rune_book_page_right.setup(
		RuneBookPageObj.new(parchment_name, "Esse pergaminho é um cocô, não use", PAGE_IMG_1),
		RuneBookItemsObj.init_with_parchment_obj("Receita", parchment_obj), 
		get_right_page_number()
	)
	
	var left_page_number := get_left_page_number()
	
	rune_book_page_left.visible = left_page_number > 0
	if rune_book_page_left.visible:
		parchment = ParchmentData.parchments_arr[current_index-1]
		parchment_name = ParchmentData.parchments_names[parchment]
		parchment_obj = ParchmentData.parchments[parchment]
		
		rune_book_page_left.setup(
			RuneBookPageObj.new(parchment_name, "Esse pergaminho é um cocô, não use", PAGE_IMG_1),
			RuneBookItemsObj.init_with_parchment_obj("Receita", parchment_obj), 
			left_page_number
		)

	book_texture.texture = TEXTURE_TWO_PAGE if rune_book_page_left.visible else TEXTURE_ONE_PAGE

func _ready() -> void:
	assert(start_page%2 == 0, "start_page is not a even number")
	update_pages()
