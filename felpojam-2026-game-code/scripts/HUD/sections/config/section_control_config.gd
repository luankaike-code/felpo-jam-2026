extends VBoxContainer

@onready var drag_mode := $MarginContainer/VBoxContainer/HBoxContainer/OptionButton as OptionButton

func _ready() -> void:
	Helpers.populate_drop_menu_with_dict(drag_mode, ControlData.str_drag_mode)
	set_values()
	connected_signals()

func set_values():
	var value := Helpers.get_dict_index_with_value(ControlData.str_drag_mode, Global.drag_mode)
	drag_mode.select(value)

func connected_signals():
	drag_mode.item_selected.connect(drag_mode_item_selected)

func drag_mode_item_selected(item_index: int):
	Global.drag_mode = ControlData.str_drag_mode.values()[item_index]
	print(ControlData.str_drag_mode.values()[item_index], Global.drag_mode, item_index)
