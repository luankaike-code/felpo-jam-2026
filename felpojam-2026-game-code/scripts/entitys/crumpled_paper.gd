class_name CrumpledPaper extends Sprite2D

enum versions {
	normal,
	with_ink
}

var current_version: versions :
	set(new):
		current_version = new
		_update_sprite()

func _update_sprite():
	frame = 0 if current_version == versions.normal else 1

func setup(version: versions) -> void:
	current_version = version
