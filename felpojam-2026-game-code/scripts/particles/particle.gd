class_name Particle extends Node2D

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

var _is_emitting := false

func _ready() -> void:
	Global.particle_is_enabled_changed.connect(_on_particle_is_enabled_changed)
	Global.particle_mode_changed.connect(_on_particle_mode_changed)

func _on_particle_mode_changed():
	set_emitting(_is_emitting)

func _on_particle_is_enabled_changed():
	if !Global.particle_is_enabled:
		cpu_particles_2d.emitting = false
		gpu_particles_2d.emitting = false
	else:
		set_emitting(_is_emitting)

func set_emitting(value: bool) -> void:
	if !Global.particle_is_enabled:
		return
		
	_is_emitting = value
	if is_to_use_cpu():
		cpu_particles_2d.emitting = value
		gpu_particles_2d.emitting = false
	else:
		gpu_particles_2d.emitting = value
		cpu_particles_2d.emitting = false

func is_to_use_cpu():
	return Global.particle_mode == ParticlesData.modes.cpu
