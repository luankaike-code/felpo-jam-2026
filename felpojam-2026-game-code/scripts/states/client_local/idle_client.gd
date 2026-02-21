extends State

var host: ClientLocal
var order: OrderObj
var is_current_state := false

func enter(host_) -> void:
	is_current_state = true
	host = host_
	host.character_sprite.toogle_area_actived(true)
	order = OrdersData.orders[host.client.order]
	
	if !host.character_sprite.receive_parchments.is_connected(_on_receive_parchments):
		host.character_sprite.receive_parchments.connect(_on_receive_parchments)	

func _on_receive_parchments(parchment_runes: Array[ParchmentObj]):
	if parchment_runes.size() == order.parchments.size():
		to_exit_client()

func to_exit_client():
	if is_current_state:
		change_state.emit("ExitClient")

func exit() -> void:
	is_current_state = false
	host.character_sprite.toogle_area_actived(false)
