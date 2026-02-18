class_name ControlData extends Node

enum drag_mode {
	hold,
	click
}

static var str_drag_mode: Dictionary[String, drag_mode] = {
	"Segurar": drag_mode.hold,
	"Clicar": drag_mode.click,
}
