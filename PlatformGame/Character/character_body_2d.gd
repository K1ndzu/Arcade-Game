extends CharacterBody2D

var speed = 5
var direction = Vector2.ZERO


func _process(delta: float) -> void:
	if(Input.is_action_pressed("move_right")):
		direction = Vector2.RIGHT
	elif(Input.is_action_pressed("move_left")):
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	
	position += direction*speed


func _physics_process(delta: float) -> void:
	move_and_slide()
