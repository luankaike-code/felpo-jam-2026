extends State

var host: ClientLocal
var speech_bubble: SpeechBubble
var order: OrderObj
var parchment_total: int
var is_alredy_connected := false
var is_current_state := false

func enter(host_) -> void:
	is_current_state = true
	host = host_
	if !is_alredy_connected:
		host.receive_total_parchments.connect(on_receive_total_parchments)
		is_alredy_connected = true
		
	host.character_sprite.entered.connect(create_speech_bubble)
		
	host.client_wait_order.emit()
	
	order = OrdersData.orders[host.current_client_data.order]
	host.enter_character()

func on_receive_total_parchments(total: int) -> void:
	parchment_total = total
	
func create_speech_bubble() -> void:
	if !is_current_state:
		return
		
	if parchment_total < order.size():
		not_craft_all_parchments()
		return
		
	var speech := SpeechsData.speechs[host.current_client_data.get_order_speech]
	speech_bubble = host.speech_bubble_manager.create_speech_bubble(speech, order.size())
	speech_bubble.all_delivery_zones_filled.connect(_on_receive_parchments)

func not_craft_all_parchments() -> void:
	host.current_order = OrderObj.new([])
	to_exit_client()

func _on_receive_parchments(parchments: Array[ParchmentObj]) -> void:
	host.current_order = OrderObj.new(parchments)
	to_exit_client()

func to_exit_client() -> void:
	change_state.emit("ExitClient")
	
func exit() -> void:
	is_current_state = false
