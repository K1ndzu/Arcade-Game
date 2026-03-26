extends CharacterBody2D

var speed = -15

func _process(delta: float) -> void:
	position.y += speed
	move_and_slide()
	
	




		
		
