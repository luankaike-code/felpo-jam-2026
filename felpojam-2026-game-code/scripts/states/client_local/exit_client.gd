extends State

var host: ClientLocal
var order: OrderObj

func enter(host_) -> void:
	host = host_
	host.character_sprite.exit()
	order = OrdersData.orders[host.client.order]
