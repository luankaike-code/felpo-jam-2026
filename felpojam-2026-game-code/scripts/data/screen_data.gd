class_name ScreenData extends Resource

enum names {
	menu,
	game,
	configurations
}

static var packeds: Dictionary[names, PackedScene] = {
	names.menu: load("res://scenes/screens/menu.tscn"),
	names.game: load("res://scenes/screens/game.tscn"),
	names.configurations: load("res://scenes/screens/configurations.tscn")
}
