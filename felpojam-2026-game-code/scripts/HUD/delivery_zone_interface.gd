class_name DeliveryZoneInterface extends TextureRect

@onready var delivery_zone: DeliveryZone = $DeliveryZone

signal filled

func _ready() -> void:
	resized.connect(_on_resized)
	delivery_zone.filled.connect(filled.emit)

func _on_resized():
	delivery_zone.resize(size)
	delivery_zone.position = size/2

func get_parchment() -> ParchmentObj:
	return delivery_zone.get_parchment()

func destroy():
	delivery_zone.destroy_current_paper()
