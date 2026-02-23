class_name Particle extends Node2D

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func set_emitting(value: bool) -> void:
	if is_to_use_cpu():
		cpu_particles_2d.emitting = value
	else:
		gpu_particles_2d.emitting = value

func is_to_use_cpu():
	return Global.particle_mode == Global.particle_modes.cpu
