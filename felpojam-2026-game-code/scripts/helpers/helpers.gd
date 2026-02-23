class_name Helpers extends Node

static func get_dict_index_with_value(dict: Dictionary, value) -> int:
	var values = dict.values()
	return values.find(value)

static func populate_drop_menu_with_dict(drop_menu: OptionButton, dict: Dictionary) -> void:
	for key in dict.keys():
		drop_menu.add_item(key)

static func populate_sprite_drop_menu_with_dict(drop_menu: SpriteDropMenu, dict: Dictionary, use_key := true) -> void:
	var items = dict.keys() if use_key else dict.values()
	for item in items:
		drop_menu.add_item(item)
