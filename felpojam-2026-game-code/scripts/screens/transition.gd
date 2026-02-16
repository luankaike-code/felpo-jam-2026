class_name Transition extends CanvasLayer

signal exit_transition_finished
signal enter_transition_finished

@onready var animation_player := $AnimationPlayer as AnimationPlayer

func _ready() -> void:
	animation_player.animation_finished.connect(on_animation_finished)

func on_animation_finished(animation: String):
	if animation == "exit":
		exit_transition_finished.emit()
		animation_player.play("enter")
	elif animation == "enter":
		enter_transition_finished.emit()

func start_transition():
	animation_player.play("exit")
