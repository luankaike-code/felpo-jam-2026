extends State

var host: ClientLocal
var order: OrderObj

func enter(host_) -> void:
	host = host_
	host.character_sprite.toogle_area_actived(true)
	order = OrdersData.orders[host.client.order]
	
	if !host.character_sprite.receive_parchments.is_connected(to_exit_client):
		host.character_sprite.receive_parchments.connect(_on_receive_parchments)

func _on_receive_parchments(parchment_runes: Array[Paper]):
	print(order.parchments, order.parchments.size(), parchment_runes, parchment_runes.size())
	if parchment_runes.size() == order.parchments.size():
		to_exit_client()

func to_exit_client():
	change_state.emit("ExitClient")

func exit() -> void:
	host.character_sprite.toogle_area_actived(false)
