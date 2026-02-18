class_name Helpers extends Node

static func get_dict_index_with_value(dict: Dictionary, value) -> int:
	var values = dict.values()
	return values.find(value)
