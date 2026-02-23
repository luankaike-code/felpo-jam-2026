extends Node

signal money_changed(diference: float)
signal particle_is_enabled_changed
signal particle_mode_changed

var current_resolution: Vector2i
var drag_mode := ControlData.drag_mode.hold
var money := 0.0 :
	set(new):
		var old_money = money
		money = new
		money_changed.emit(money - old_money)

var particle_is_enabled := true :
	set(new):
		particle_is_enabled = new
		particle_is_enabled_changed.emit()

var particle_mode := ParticlesData.modes.cpu :
	set(new):
		particle_mode = new
		particle_mode_changed.emit()
