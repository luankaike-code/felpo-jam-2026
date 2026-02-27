class_name SpriteDropMenu extends VBoxContainer

var packed_sprite_button := preload("res://scenes/HUD/sprite_button.tscn") as PackedScene

@onready var options_conteiner := $MarginContainer/MarginContainer/OptionsConteiner as VBoxContainer
@onready var main_sprite_button: SpriteButton = $MainSpriteButton
@onready var nine_patch_rect: NinePatchRect = $MarginContainer/NinePatchRect
@onready var floating_container: MarginContainer = $MarginContainer

var options_is_open := false

var options: Array[SpriteButton]
var old_global_position := Vector2.ZERO

signal item_selected(index: int)

func _ready() -> void:
	add_to_group("SpriteDropMenu")
	floating_container.size.x = size.x
	main_sprite_button.button_up.connect(_toggle_option_visibility)

func _toggle_option_visibility():
	if options_is_open:
		_close_options()
	else:
		_open_options()

func add_item(item_text: String) -> void:
	var sprite_button := packed_sprite_button.instantiate() as SpriteButton
	
	sprite_button.button_up.connect(func(): _on_option_button_up(sprite_button))
	sprite_button.text = item_text
	sprite_button.size_flags_horizontal = Control.SIZE_FILL
	
	options.push_back(sprite_button)

func select(index: int):
	main_sprite_button.text = options[index].text

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if old_global_position == Vector2.ZERO:
		old_global_position = global_position
	elif old_global_position != global_position:
		old_global_position = global_position
		_close_options()

func _on_option_button_up(sprite_button: SpriteButton) -> void:
	var item_index = options.find(sprite_button)
	item_selected.emit(item_index)
	
	main_sprite_button.text = sprite_button.text
	_close_options()

func _close_options_other_sprite_drop_menu():
	for sdm in get_tree().get_nodes_in_group("SpriteDropMenu"):
		if sdm != self && sdm.options_is_open:
			sdm._close_options()

func  _update_options_conteiner_position():
	floating_container.global_position.x = global_position.x
	floating_container.global_position.y = global_position.y + size.y

func  _set_options_conteiner_position_to_off_screen():
	var viewport_rect := get_viewport_rect()
	floating_container.global_position = viewport_rect.position + viewport_rect.size

func _open_options():
	_close_options_other_sprite_drop_menu()
	_update_options_conteiner_position()
	
	for option in options:
		options_conteiner.add_child(option)
		option.size.x = main_sprite_button.size.x
		
	options_is_open = true
	nine_patch_rect.visible = true

func _close_options():	
	_set_options_conteiner_position_to_off_screen()
	for option in options:
		if option && option.get_parent() == options_conteiner:
			options_conteiner.remove_child(option)
		
	options_is_open = false
	nine_patch_rect.visible = false
