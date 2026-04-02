extends CharacterBody2D


var speed = 1000

func _process(delta: float) -> void:
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	position.x += speed * direction * delta
	
	move_and_slide()
