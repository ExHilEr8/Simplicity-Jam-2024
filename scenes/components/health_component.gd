extends Node
class_name HealthComponent

@export_group("General")
@export var health_max : int = 100

@onready var health : int = health_max :
	set(value):
		health = clamp(value, 0, health_max)
	get:
		return health

signal damaged
signal healed

func damage(value) -> void:
	health -= value
	damaged.emit()

func heal(value) -> void:
	health += value
	healed.emit()