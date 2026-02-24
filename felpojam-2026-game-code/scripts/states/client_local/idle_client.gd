extends State

var host: ClientLocal
var speech_bubble: SpeechBubble
var order: OrderObj

func enter(host_) -> void:
	host = host_
	var speech := SpeechsData.speechs[host.current_client_data.speech]
	order = OrdersData.orders[host.current_client_data.order]
	speech_bubble = host.speech_bubble_manager.create_speech_bubble(speech, order.size())
	speech_bubble.all_delivery_zones_filled.connect(_on_receive_parchments)

func _on_receive_parchments(parchments: Array[ParchmentObj]):
	host.current_order = OrderObj.new(parchments)
	to_exit_client()

func to_exit_client():
	change_state.emit("ExitClient")
