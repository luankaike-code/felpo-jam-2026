extends VBoxContainer


@onready var resolution_drop_menu := $MarginContainer/VBoxContainer/ScreenResolution/SpriteDropMenu as SpriteDropMenu
@onready var screen_mode_drop_menu := $MarginContainer/VBoxContainer/SreenMode/SpriteDropMenu as SpriteDropMenu
@onready var v_sync_checkbox := $MarginContainer/VBoxContainer/VSync/SpriteCheckBox as SpriteCheckBox
@onready var particles_check_box: SpriteCheckBox = $MarginContainer/VBoxContainer/Particles/SpriteCheckBox
@onready var particle_mode_drop_menu: SpriteDropMenu = $MarginContainer/VBoxContainer/ParticleMode/SpriteDropMenu

func _ready() -> void:
	Helpers.populate_sprite_drop_menu_with_dict(resolution_drop_menu, WindowData.resolutions)
	Helpers.populate_sprite_drop_menu_with_dict(screen_mode_drop_menu, WindowData.screen_modes)
	Helpers.populate_sprite_drop_menu_with_dict(particle_mode_drop_menu, ParticlesData.str_modes)
	
	set_current_values()
	
	connected_signals()

func set_current_values():
	v_sync_checkbox.value = HelperWindow.get_v_sync()
	particles_check_box.value = Global.particle_is_enabled
	
	var resolution_index = Helpers.get_dict_index_with_value(WindowData.resolutions, get_window().content_scale_size)
	resolution_drop_menu.select(resolution_index)
	
	var particle_index = Helpers.get_dict_index_with_value(ParticlesData.str_modes, Global.particle_mode)
	particle_mode_drop_menu.select(particle_index)
	
	var screen_mode_index = Helpers.get_dict_index_with_value(WindowData.screen_modes, get_window().mode)
	screen_mode_drop_menu.select(screen_mode_index)

func connected_signals() -> void:
	resolution_drop_menu.item_selected.connect(resolution_selected)
	screen_mode_drop_menu.item_selected.connect(screen_mode_selected)
	particle_mode_drop_menu.item_selected.connect(particle_mode_selected)
	
	v_sync_checkbox.changed.connect(HelperWindow.set_v_sync)
	particles_check_box.changed.connect(particles_changed)

func particles_changed(value: bool):
	Global.particle_is_enabled = value

func resolution_selected(resolution_index: int) -> void:
	var resolution: Vector2i = WindowData.resolutions.values()[resolution_index]
	
	HelperWindow.set_resolution(resolution)

func screen_mode_selected(screen_mode_index: int) -> void:
	var screen_mode: Window.Mode = WindowData.screen_modes.values()[screen_mode_index]
	
	HelperWindow.set_window_mode(screen_mode)
	HelperWindow.set_resolution(Global.current_resolution)

func particle_mode_selected(particle_mode_index: int) -> void:
	var particle_mode = ParticlesData.str_modes.values()[particle_mode_index]
	Global.particle_mode = particle_mode
	
