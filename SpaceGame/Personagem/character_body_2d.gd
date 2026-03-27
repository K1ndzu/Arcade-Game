extends CharacterBody2D

var died : bool = false
var bullet = preload("res://SpaceGame/Personagem/bullet.tscn")
@onready var animation = $AnimatedSprite2D
@onready var selfArea : Area2D = $Area2D

var lives : int = 3
var speed: float = 12.5
var state: String = "Idle"
var direction: Vector2 = Vector2.ZERO


func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("sair")):
		get_tree().change_scene_to_file("res://CenaPrincipal/CenaPrincipal.tscn")
	
	if(died == false):
		if(Input.is_action_just_pressed("Fire")):
			fire()
	
	
	direction.x = -Input.get_action_strength("move_left") + Input.get_action_strength("move_right")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	updateAnimation()
	animation.play(state)
	
	position += speed * direction
	move_and_slide()
	

func updateAnimation() -> void:
	if(died == true):
		state = "Death"
	elif(direction == Vector2.LEFT):
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
	
	

func death():
	died = true
	speed = 0
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("enemy")):
		speed = 0
		died = true
		print(died)
		updateAnimation()
		selfArea.queue_free()
		await animation.animation_finished
		self.queue_free()
		SpaceGameManager.lives.emit(-1)
	
