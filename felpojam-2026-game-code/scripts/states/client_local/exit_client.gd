extends State

var host: ClientLocal
var order_result: ClientResult

func get_order_quality() -> float:
	var order = OrdersData.orders[host.current_client_data.order]
	return Calc.calc_order_obj_proximity(order, host.current_order)

func get_order_result(order_quality: float) -> ClientResult:
	var client_name := ClientData.order[host.current_client_order_index]
	var results := ClientData.client_result[client_name]
	var current_result: ClientResult
	
	if order_quality >= 0.8:
		current_result = results.positive
	elif order_quality >= 0.4:
		current_result = results.ok
	else:
		current_result = results.negative
	
	return current_result

func _on_finish_all_dialogs():
	handle_client_result_mensage()
	change_state.emit("Idle")

func handle_client_result_mensage():
	if order_result.mensage is ClientResultMensageMoney:
		Global.money += order_result.mensage.money
	host.character_sprite.exit()

func enter(host_) -> void:
	host = host_
	
	var order_quality :=  get_order_quality()
	order_result = get_order_result(order_quality)
	
	var speech := SpeechsData.speechs[order_result.speech]
	var speech_bubble := host.speech_bubble_manager.create_speech_bubble(speech)
	speech_bubble.finish_all_dialogs.connect(_on_finish_all_dialogs)

func exit():
	host.current_client_order_index += 1
	host.current_client_order_index %= ClientData.order.size()
