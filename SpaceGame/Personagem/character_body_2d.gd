extends CharacterBody2D

var died : bool = false
var bullet = preload("res://SpaceGame/Personagem/bullet.tscn")
@onready var animation = $AnimatedSprite2D
@onready var selfArea : Area2D = $Area2D
@onready var shootAudio = $ShootSound

var time : float = 0
var timeShot = 0
var lives : int = 3
var speed: float = 12.5
var state: String = "Idle"
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	$Area2D/CollisionShape2D.disabled = true
	
	var tween = create_tween().set_loops()
	tween.tween_property(animation,"modulate", Color(10,10,10,1), 0.1)
	tween.tween_property(animation,"modulate", Color(1,1,1,1), 0.1)
	await  get_tree().create_timer(1,0).timeout
	tween.kill()
	animation.modulate = Color(1,1,1,1)
	$Area2D/CollisionShape2D.disabled = false
	
	




func _process(delta: float) -> void:
	if(died == false):
		if(Input.is_action_pressed("Fire")):
			timeShot += 0.1
			if(timeShot >= 1):
				fire()
				timeShot = 0
	
	
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
	shootAudio.play()
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
		updateAnimation()
		selfArea.queue_free()
		await animation.animation_finished
		self.queue_free()
		SpaceGameManager.lives.emit(-1)
	
