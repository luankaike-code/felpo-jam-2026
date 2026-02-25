class_name ClientResultPossibility extends Resource

var positive: ClientResult
var ok: ClientResult
var negative: ClientResult
var not_craft_all_parchments: ClientResult

func _init(positive_: ClientResult, ok_: ClientResult, negative_: ClientResult, not_craft_all_parchments_: ClientResult) -> void:
	positive = positive_
	ok = ok_
	negative = negative_
	not_craft_all_parchments = not_craft_all_parchments_
