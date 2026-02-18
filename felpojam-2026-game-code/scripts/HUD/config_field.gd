@tool
extends HBoxContainer

@onready var label := $Label as Label
@export var label_text: String :
	set(new):
		label_text = new
		update_label_text()

func _ready() -> void:
	update_label_text()
	
func update_label_text() -> void:
	if label:
		label.text = label_text
