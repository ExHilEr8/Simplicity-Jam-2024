extends Node
class_name HealthComponent

@export_group("General")
@export var health_max : int = 100
@export var health_display : ProgressBar

@onready var health : int = health_max :
	set(value):
		health = clamp(value, 0, health_max)
	get:
		return health

signal damaged
signal healed

func _ready():
	if health_display:
		health_display.max_value = health_max
		health_display.min_value = 0
		health_display.value = health

		damaged.connect(update_health_display)
		healed.connect(update_health_display)

func damage(value) -> void:
	health -= value
	damaged.emit()

func heal(value) -> void:
	health += value
	healed.emit()

func update_health_display() -> void:
	health_display.value = health