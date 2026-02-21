extends State

var host: ClientLocal
var order: OrderObj
var already_connect_with_delivery_bubble := false

func enter(host_) -> void:
	host = host_
	order = OrdersData.orders[host.current_client_data.order]
	host.open_delivery_bubble()
	
	if !already_connect_with_delivery_bubble:
		host.delivery_bubble.all_fields_filled.connect(_on_receive_parchments)
		already_connect_with_delivery_bubble = true

func _on_receive_parchments():
	to_exit_client()

func to_exit_client():
	change_state.emit("ExitClient")
