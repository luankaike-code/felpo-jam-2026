class_name CraftLocal extends Local

@onready var runes_book: RunesBook = $RunesBook
@onready var stack_papers: StackPapers = $StackPapers

func _ready() -> void:
	super()
	
	runes_book.open.connect(open_pop_up.emit)
	stack_papers.spawn_node.connect(func(x): add_child(x))
