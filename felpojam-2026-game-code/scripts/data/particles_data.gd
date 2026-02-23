class_name ParticlesData extends Resource

enum modes {
	cpu,
	gpu
}

static var str_modes: Dictionary[String, modes] = {
	"CPU": modes.cpu,
	"GPU": modes.gpu
}
