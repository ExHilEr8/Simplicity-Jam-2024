extends Node
class_name PlayerHealthComponent

@export_group("General")
@export var health_max : int = 3

@onready var health : int = health_max :
	set(value):
		health = clamp(value, 0, health_max)
	get:
		return health