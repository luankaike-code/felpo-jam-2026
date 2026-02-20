class_name ClientResultPossibility extends Resource

var positive: ClientResult
var ok: ClientResult
var negative: ClientResult

func _init(positive_: ClientResult, ok_: ClientResult, negative_: ClientResult) -> void:
	positive = positive_
	ok = ok_
	negative = negative_
