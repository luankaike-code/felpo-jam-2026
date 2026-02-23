class_name ParticleRune extends Particle

func set_radius(value: float) -> void:
	cpu_particles_2d.emission_sphere_radius = value
	gpu_particles_2d.process_material.emission_sphere_radius = value

func set_color(value: Color) -> void:
	cpu_particles_2d.color = value
	gpu_particles_2d.process_material.color = value
