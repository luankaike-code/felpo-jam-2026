extends State

var host: ClientLocal

func enter(host_) -> void:
	print("oi")
	host = host_
	host.character_sprite.toogle_area_actived(true)
	if !host.character_sprite.receive_runes.is_connected(to_exit_client):
		host.character_sprite.receive_runes.connect(to_exit_client)

func to_exit_client():
	change_state.emit("ExitClient")

func exit() -> void:
	host.character_sprite.toogle_area_actived(false)
