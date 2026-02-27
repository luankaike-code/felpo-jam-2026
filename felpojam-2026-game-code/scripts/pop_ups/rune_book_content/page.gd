class_name BookPage extends TabBar

var packed_book_item := preload("res://scenes/pop_ups/rune_book_content/book_item.tscn")

@onready var left_page: VBoxContainer = $MarginContainer/VBoxContainer/MarginContainer2/HBoxContainer/LeftPage
@onready var right_page: VBoxContainer = $MarginContainer/VBoxContainer/MarginContainer2/HBoxContainer/RightPage
@onready var num_page_left: Label = $MarginContainer/VBoxContainer/HBoxContainer/NumPageLeft
@onready var num_page_right: Label = $MarginContainer/VBoxContainer/HBoxContainer/NumPageRight

var parchments: Array
var item_count: int
var page_count: int

func _ready() -> void:
	set_page_number(page_count)
	
	@warning_ignore("integer_division")
	populate_page(left_page, Helpers.get_array_range(parchments, 0, item_count/2))
	@warning_ignore("integer_division")
	populate_page(right_page, Helpers.get_array_range(parchments, item_count/2, item_count))

func set_page_number(num: int) -> void:
	var base_text := "Pag. %o"
	num_page_left.text = base_text % num
	num_page_right.text = base_text % (num+1)

func populate_page(page: VBoxContainer, content: Array):
	for item in content:
		var item_book = packed_book_item.instantiate()
		item_book.text = get_item_book_text(item)
		page.add_child(item_book)

func get_item_book_text(parchment: ParchmentData.names) -> String:
	var parchment_name := ParchmentData.parchments_names[parchment]
	
	var parchment_obj := ParchmentData.parchments[parchment]
	var runes_text := get_runes_text(parchment_obj)
	
	return "%s: %s" % [parchment_name, runes_text]

func get_runes_text(parchment_obj: ParchmentObj) -> String:
	var texts: Array
	for runes in parchment_obj.content:
		var rune_name = RunesData.string[runes.rune]
		var rune_level = "+".repeat(runes.level)
		texts.push_back("%s%s" % [rune_name, rune_level])
		
	return " E ".join(texts)

func setup(item_count_: int, parchments_: Array, page_count_: int) -> void:
	if parchments.size() >= item_count_:
		assert(false, "Max item outdated")
	elif item_count_%2 != 0:
		assert(false, "Item count is not a even number")
	
	item_count = item_count_
	parchments = parchments_
	page_count = page_count_
