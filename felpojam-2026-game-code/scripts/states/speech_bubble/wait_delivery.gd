extends State

var host: SpeechBubble
var packed_delivery_zone := preload("res://scenes/HUD/delivery_zone_interface.tscn") as PackedScene
var delivery_zones: Array[DeliveryZoneInterface]

func enter(host_) -> void:
	host = host_
	delivery_zones = []
	clear_delivery_zone_conteiner()
	add_delivery_zone(host.delivery_zone_count)

func clear_delivery_zone_conteiner():
	for child in host.delivery_zone_conteiner.get_children():
		child.queue_free()

func add_delivery_zone(count: int):
	for i in count:
		var delivery_zone := packed_delivery_zone.instantiate() as DeliveryZoneInterface
		delivery_zone.filled.connect(is_all_delivery_zone_filled)
		delivery_zones.push_back(delivery_zone)
		host.delivery_zone_conteiner.add_child(delivery_zone)

func is_all_delivery_zone_filled():
	var parchments: Array[ParchmentObj]
	for dz in delivery_zones:
		var parchment = dz.get_parchment()
		
		if !parchment:
			return
		parchments.append(parchment)
	host.all_delivery_zones_filled.emit(parchments)
