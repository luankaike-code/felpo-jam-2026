class_name ParticleRune extends Particle

func set_radius(value: float):
	cpu_particles_2d.emission_sphere_radius = value
	gpu_particles_2d.process_material.emission_sphere_radius = value
