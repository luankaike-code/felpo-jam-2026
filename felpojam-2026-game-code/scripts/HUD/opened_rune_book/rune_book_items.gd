class_name RuneBookItems extends VBoxContainer

@export var item_label_style: LabelSettings = preload("uid://ckpsmscigpqim")

@onready var items_title: Label = $ItemsTitle
@onready var items_content_column_left: VBoxContainer = $ItemsContentMargin/ItemsContent/ItemsContentColumnLeft
@onready var items_content_column_right: VBoxContainer = $ItemsContentMargin/ItemsContent/ItemsContentColumnRight
@onready var items_content_margin: MarginContainer = $ItemsContentMargin

func _ready() -> void:
	items_content_column_left.child_entered_tree.connect(configure_label_shader)
	items_content_column_right.child_entered_tree.connect(configure_label_shader)

func setup(obj: RuneBookItemsObj):
	items_title.text = obj.items_title
	
	var use_two_columns := obj.items.size() > 2
	populate_items_content_columns(obj.items, use_two_columns)

func populate_items_content_columns(items: Array[String], use_two_columns: bool) -> void:
	var left_items := Helpers.get_array_range(items, 0, 2)
	populate_items_content_column(items_content_column_left, left_items)
	if use_two_columns:
		var right_items: Array = Helpers.get_array_range(items, 2, 4)
		populate_items_content_column(items_content_column_right, right_items)

func populate_items_content_column(column: VBoxContainer, items: Array) -> void:
	clear_items_content_column(column)
	
	for item in items:
		var label := Label.new()
		
		label.text = item
		label.label_settings = item_label_style
		call_deferred("call_deferred", "call_deferred", "configure_label_shader", label)
		
		column.add_child(label)

func configure_label_shader(node: Node) -> void:
	if !node is Label:
		return
		
	node.material = material.duplicate()
	var shader_size = node.material.get_shader_parameter("size")
	
	if !shader_size:
		return
		
	var pos_arr := [node.global_position.x, items_content_margin.global_position.x]
	var pos: float = pos_arr.max() - pos_arr.min()
	var rel_pos: float = pos/shader_size
	
	node.material.set_shader_parameter("relative_pos", rel_pos)

func clear_items_content_column(column: VBoxContainer) -> void:
	for child in column.get_children():
		child.queue_free()
