class_name TransitionDrawer extends Node2D

signal finish_normal_animation
signal finish_reverse_animation

var duration := 7
var playing := false
var current_radius := 0.0
var start_point: Vector2
var radius_max: float
var direction := 1


func _draw() -> void:
	if !playing:
		return
	elif current_radius >= radius_max:
		direction = -1
		finish_normal_animation.emit()
	elif direction < 0 && current_radius <= 0:
		finish_reverse_animation.emit()
		reset_animation_vars()
		return
	
	draw_circle(start_point, current_radius, Color.BLACK)
	current_radius += (radius_max / duration/2) * direction
	
	get_tree().create_timer(0.01).timeout.connect(queue_redraw)

func reset_animation_vars():
	playing = false
	direction = 1
	current_radius = 0

func get_viewport_infos():
	var viewport = get_viewport()
	
	start_point = viewport.get_mouse_position()
	radius_max = viewport.get_visible_rect().size.x * 1.5

func play():
	if playing:
		return
	playing = true
	get_viewport_infos()
	
	queue_redraw()
	
	
