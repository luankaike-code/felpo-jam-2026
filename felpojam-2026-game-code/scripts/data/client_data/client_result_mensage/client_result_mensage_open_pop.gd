class_name ClientResultMensageOpenPop extends ClientResultMensage

var pop_up: PopUp

func _init(pop_up_: PackedScene) -> void:
	pop_up = pop_up_.instantiate()
