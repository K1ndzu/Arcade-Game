extends CharacterBase


func _process(delta: float) -> void:
	print(velocity.y)
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if(is_on_floor() && Input.is_action_just_pressed("jump")):
		velocity.y -= 100
	elif (not is_on_floor()):
		aplicarGravidade(delta)
	
	
	position.x += direction*speed
	
	

func _physics_process(delta: float) -> void:
	if(not is_on_floor()):
		aplicarGravidade(delta)
	move_and_slide()
