class_name PopUpConfirm extends PopUp

var packed_sprite_button := preload("res://scenes/HUD/sprite_button.tscn")
@onready var button_conteiner: HBoxContainer = $MarginContainer/MarginContainer/VBoxContainer/ButtonConteiner
@onready var label: Label = $MarginContainer/MarginContainer/VBoxContainer/MarginContainer/Label

var text: String
var buttons:  Array[PopUpConfirmButtonObj]

func setup(mensage: String, buttons_: Array[PopUpConfirmButtonObj]):
	text = mensage
	buttons = buttons_
	
func _ready() -> void:
	label.text = text
	for button in buttons:
		var btn_node := packed_sprite_button.instantiate() as SpriteButton
		
		btn_node.text = button.text
		btn_node.size_flags_horizontal = Control.SIZE_SHRINK_CENTER + Control.SIZE_EXPAND
		
		btn_node.button_up.connect(func(): send_mensage.emit(button.pop_up_mensagem))
		
		button_conteiner.add_child(btn_node)
