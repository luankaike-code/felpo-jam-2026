@tool
extends HBoxContainer

@onready var label := $Label as Label
@export var label_text: String :
	set(new):
		label_text = new
		if label:
			label.text = label_text
		
