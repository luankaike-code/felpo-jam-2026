class_name TutorialClientLocal extends ClientLocal

signal table_bell_click

func _ready() -> void:
	table_bell.modulate = Color(1.0, 1.0, 0.0, 1.0)
	table_bell.pressed.connect(new_client)

func new_client():
	table_bell.modulate = Color(1.0, 1.0, 1.0, 1.0)
	table_bell.enable = false
	table_bell_click.emit()
	
	if state_machine.current_state.name != "Idle":
		return

	current_client_data = ClientData.client[ClientData.names.tutorial_guy]
	
	state_machine.change_state("NewClient")
