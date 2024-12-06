extends CharacterBody2D

@export var sprite = Sprite2D
@export var speed : float = 400
@export var player_health_component : PlayerHealthComponent 

var character_direction : Vector2 = Vector2.ZERO
var character_velocity : Vector2 = Vector2.ZERO

func _physics_process(_delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")

	if character_direction.x > 0: 
		sprite.flip_h = false
	elif character_direction.x < 0:
		sprite.flip_h = true

	if character_direction:	
		velocity = character_direction.normalized() * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	character_velocity = velocity
		
	move_and_slide()


