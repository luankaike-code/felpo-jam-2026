extends State

var host: ClientLocal
var client_result_obj: ClientResultObj

func enter(host_) -> void:
	host = host_
	host.exit_client.emit()
	
	client_result_obj = get_client_result_obj()
	host.character_sprite.set_version(client_result_obj.character_version)
	
	var speech := SpeechsData.speechs[client_result_obj.result.speech]
	var speech_bubble := host.speech_bubble_manager.create_speech_bubble(speech)
	speech_bubble.finish_all_dialogs.connect(_on_finish_all_dialogs)

func get_client_result_obj() -> ClientResultObj:
	var order_quality :=  get_order_quality()
	var results := ClientData.client_result[host.current_client_name]
	
	return HelperData.get_client_result(order_quality, results)

func get_order_quality() -> float:
	if host.current_order.size() < 1:
		return -1
	var order = OrdersData.orders[host.current_client_data.order]
	return Calc.calc_order_obj_proximity(order, host.current_order)

func _on_finish_all_dialogs():	
	host.handle_client_result_mensage(client_result_obj.result)
	host.character_sprite.exit()
	
	change_state.emit("Idle")

func exit():
	host.current_client_order_index += 1
	host.current_client_order_index %= ClientData.order.size()
