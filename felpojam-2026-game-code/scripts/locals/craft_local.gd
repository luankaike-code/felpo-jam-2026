class_name CraftLocal extends Local

@onready var runes_book: RunesBook = $RunesBook
@onready var stack_papers: StackPapers = $StackPapers

func _ready() -> void:
	runes_book.open.connect(open_pop_up.emit)
	stack_papers.spawn_node.connect(func(x): 
		print("porra: ", x)
		add_child(x)
	)
