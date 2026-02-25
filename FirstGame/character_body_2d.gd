extends CharacterBody2D


var bullet = preload("res://FirstGame/bullet.tscn")
@onready var animation = $AnimatedSprite2D
@onready var collision = $CollisionShape2D


var speed: float = 12.5
var score
var state: String = "Idle"
var direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("sair")):
		get_tree().change_scene_to_file("res://CenaPrincipal/CenaPrincipal.tscn")
	
	if(Input.is_action_just_pressed("Fire")):
		fire()
	
	
	direction.x = -Input.get_action_strength("move_left") + Input.get_action_strength("move_right")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	updateAnimation()
	animation.play(state)
	
	position += speed * direction
	move_and_slide()
	

func updateAnimation() -> void:
	if(direction == Vector2.LEFT):
		state = "Left"
	elif (direction == Vector2.RIGHT):
		state = "Right"
	else:
		state = "Idle"
		
	
func fire():
	var shot = bullet.instantiate()
	shot.global_position.y = self.global_position.y - 10
	shot.global_position.x = self.global_position.x
	get_parent().add_child(shot)
	
