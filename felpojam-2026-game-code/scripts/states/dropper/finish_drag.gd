extends State

var host: Dropper
var current_state := false
var alredy_connections := false
var default_dad: Node2D
var current_paper: Paper
var current_rune: Rune

func enter(host_) -> void:
	host = host_
	current_state = true
	
	if !alredy_connections:
		host.animation_player.animation_finished.connect(_on_animation_finished_dripping)
		alredy_connections = true
		
	if host.current_rune:
		default_dad = host.get_parent()
		host.is_draggable = false
		host.animation_player.play("dripping")
		flow_current_paper()
	else:
		return_to_stand()

func _on_animation_finished_dripping(anim_name: String) -> void:
	if anim_name != "dripping" || !current_state:
		return

	host.is_draggable = true
	update_rune()
	return_to_stand()

func flow_current_paper() -> void:
	if host.current_paper && host.current_rune && default_dad:
		current_paper = host.current_paper
		current_rune = host.current_rune
		default_dad.remove_child(host)
		host.position = current_rune.position
		current_paper.add_child(host)

func update_rune() -> void:
	if host.current_rune:
		host.current_rune.level_up()

func return_to_stand() -> void:
	if current_paper && default_dad && host.get_parent() != default_dad:
		current_paper.remove_child(host)
		default_dad.add_child(host)
	var result := false
	host.into_stand = true
	
	if host.current_stand:
		result = host.current_stand.place_item(host)
		
	if !result:
		host.default_stand.place_item(host)
	elif host.current_stand is DropperStand:
		host.current_stand.has_dropper = true

func exit() -> void:
	current_state = false
	default_dad = null
