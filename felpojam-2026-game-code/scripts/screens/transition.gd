class_name Transition extends CanvasLayer

signal exit_transition_finished
signal enter_transition_finished

@onready var transition_drawer: TransitionDrawer = $TransitionDrawer

func _ready() -> void:
	transition_drawer.finish_normal_animation.connect(exit_transition_finished.emit)
	transition_drawer.finish_reverse_animation.connect(enter_transition_finished.emit)

func start_transition():
	transition_drawer.play()
