extends HealthComponent
class_name EnemyHealthComponent

@export_group("General")
@export var health_display : ProgressBar

func _ready():
	if health_display:
		health_display.max_value = health_max
		health_display.min_value = 0
		health_display.value = health

		damaged.connect(update_health_display)
		healed.connect(update_health_display)

func update_health_display() -> void:
	health_display.value = health