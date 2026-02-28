class_name ScreenData extends Resource

enum names {
	menu,
	game,
	configurations,
	tutorial,
	you_survived,
	you_dead
}

static var packeds: Dictionary[names, PackedScene] = {
	names.menu: preload("res://scenes/screens/menu.tscn"),
	names.game: preload("res://scenes/screens/game.tscn"),
	names.configurations: preload("res://scenes/screens/configurations.tscn"),
	names.tutorial: preload("res://scenes/screens/tutorial.tscn"),
	names.you_survived: preload("res://scenes/screens/you_survived.tscn"),
	names.you_dead: preload("res://scenes/screens/you_dead.tscn"),
}
