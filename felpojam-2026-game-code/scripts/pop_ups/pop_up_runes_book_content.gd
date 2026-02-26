extends PopUp

@onready var tab_container: TabContainer = $CanvasLayer/Control/MarginContainer/TabContainer

func _ready() -> void:
	Sound.play_sound(SoundData.names.open_book)
	tab_container.tab_changed.connect(_on_pass_page)
	send_pause_mensage(true)

@warning_ignore("unused_parameter")
func _on_pass_page(page_index: int):
	Sound.play_sound(SoundData.names.pass_page)

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Sound.play_sound(SoundData.names.close_book)
		send_pause_mensage(false)
		queue_free()
