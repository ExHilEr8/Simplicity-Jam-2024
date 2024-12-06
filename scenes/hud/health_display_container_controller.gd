extends HBoxContainer

@export var hud_manager : HudManager

@onready var player_health_component : PlayerHealthComponent

var current_health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	player_health_component = hud_manager.player_reference.player_health_component
	update_health_display()


func update_health_display() -> void:
	current_health = player_health_component.health