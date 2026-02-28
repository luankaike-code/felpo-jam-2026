class_name CraftLocal extends Local

@onready var runes_book: RunesBook = $RunesBook
@onready var stack_papers: StackPapers = $StackPapers
@onready var trash: Trash = $Trash

var papers_with_runes: Array[Paper]

func _ready() -> void:
	super()
	
	runes_book.open.connect(open_pop_up.emit)
	stack_papers.want_spawn_paper.connect(_on_spawn_paper)

func _on_spawn_paper(paper_to_spawn: Paper) -> void:
	paper_to_spawn.rune_added.connect(_on_rune_added)
	add_child(paper_to_spawn)

func _on_rune_added(paper: Paper) -> void:
	paper.rune_added.disconnect(_on_rune_added)
	papers_with_runes.push_back(paper)

func get_paper_with_rune_count() -> int:
	papers_with_runes = papers_with_runes.filter(func(paper): return !!paper)
	return papers_with_runes.size()

func set_enable_trash(value: bool):
	trash.enable = value

func set_enable_craft_items(value: bool) -> void:
	var children = get_children()
	for draggable in get_tree().get_nodes_in_group("draggables"):
		var is_craft_item := draggable is Stamp || draggable is Dropper
		var dad = draggable.get_parent() 
		var is_child = dad == self || dad in children
		if is_craft_item and is_child:
			print(value)
			draggable.is_freeze = !value
