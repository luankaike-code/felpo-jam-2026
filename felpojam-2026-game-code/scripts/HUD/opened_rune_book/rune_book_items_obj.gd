class_name RuneBookItemsObj extends Node

const MAX_ITEMS_COUNT := 4
var items_title: String
var items: Array[String]

func _init(items_title_: String, items_: Array[String]) -> void:
	assert(items_.size() < MAX_ITEMS_COUNT+1, "MAX_ITEMS_COUNT is outdated")
	items_title = items_title_
	items = items_

static func init_with_parchment_obj(items_title_: String, parchment_obj: ParchmentObj) -> RuneBookItemsObj:
	var items_: Array[String]
	
	for rune_obj in parchment_obj.content:
		var rune_name := RunesData.string[rune_obj.rune]
		var level_indicator := "+".repeat(rune_obj.level)
		items_.push_back("%s %s" % [rune_name, level_indicator])

	return RuneBookItemsObj.new(items_title_, items_)
