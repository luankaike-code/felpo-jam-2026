extends Node

enum particle_modes {
	cpu,
	gpu
}

signal money_changed(diference: float)

var current_resolution: Vector2i
var drag_mode: ControlData.drag_mode
var money: float :
	set(new):
		var old_money = money
		money = new
		money_changed.emit(money - old_money)
var particle_mode := particle_modes.cpu
