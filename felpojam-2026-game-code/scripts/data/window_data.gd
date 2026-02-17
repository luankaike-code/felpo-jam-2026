class_name WindowData extends Node

static var resolutions: Dictionary[String, Vector2i] = {
	"3840X2160": Vector2i(3840, 2160),
	"1920X1080": Vector2i(1920, 1080),
	"1440X900": Vector2i(1440, 900),
	"1290X720": Vector2i(1290, 720),
	"648X648": Vector2i(648, 648),
}

static var screen_modes: Dictionary[String, Window.Mode] = {
	"janela": Window.MODE_WINDOWED,
	"tela cheia": Window.MODE_FULLSCREEN,
}
