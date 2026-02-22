class_name ClientLocal extends Local

@onready var character_sprite := $CharacterSprite as CharacterSprite
@onready var speech_bubble_manager := $SpeechBubbleManager as SpeechBubbleManager
@onready var state_machine := $StateMachine as StateMachine
@onready var delivery_bubble := $DeliveryBubble as DeliveryBubble

var current_client_order_index: int
var current_client_data: ClientObj

func new_client():
	var client_name := ClientData.order[current_client_order_index]
	current_client_data = ClientData.client[client_name]
	
	state_machine.change_state("NewClient")

func open_delivery_bubble():
	delivery_bubble.open()
	for i in OrdersData.orders[current_client_data.order].parchments:
		delivery_bubble.add_delivery_zone()

func close_delivery_bubble():
	delivery_bubble.close()

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_copy"):
		if state_machine.current_state.name == "ExitClient":
			new_client()
