extends State

var host: ClientLocal
var order_quality: float

func enter(host_) -> void:
	host = host_
	var pos := host.character_sprite.global_position
	
	var order = OrdersData.orders[host.client.order]
	var o := OrderObj.new(host.character_sprite.stand_character_sprite.parchments)
	order_quality =  Calc.calc_order_obj_proximity(order, o)
	
	var client_name := ClientData.order[host.current_client_order_index]
	var results := ClientData.client_result[client_name]
	var current_result: ClientResult
	
	if order_quality >= 0.8:
		current_result = results.positive
	elif order_quality >= 0.4:
		current_result = results.ok
	else:
		current_result = results.negative
	
	var speech := SpeechsData.speechs[current_result.speech]
	var speech_bubble := host.speech_bubble_manager.create_speech_bubble(speech, pos)
	speech_bubble.finish_all_dialogs.connect(host.character_sprite.exit)
