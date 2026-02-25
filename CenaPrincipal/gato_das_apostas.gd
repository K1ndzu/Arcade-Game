extends CharacterBody2D


@onready var animationPlayer = $AnimationPlayer 
var cardinalDirection : Vector2 = Vector2.ZERO
var direction : Vector2 = Vector2.ZERO
var speed = 300
var state : String = "Idle"



func _physics_process(delta: float) -> void:
	move_and_slide()
	
func _process(delta: float) -> void:
	
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	
	velocity = direction * speed
	
	
	if(setDirection() == true || setState() == true ):
		updateAnimation()
	

	

func setState() -> bool:
	var new_state : String
	if (direction == Vector2.ZERO):
		new_state = "Idle"
	else:
		new_state = "Run"
	
	if (state == new_state):
		return false
	else:
		state = new_state
		return true
	
func setDirection() -> bool:
	var newDirection: Vector2 = cardinalDirection
	if (direction == Vector2.ZERO):
		newDirection = Vector2.ZERO
	elif(direction.y == 0 ):
		newDirection = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT 
	elif(direction.x == 0):
		newDirection = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if(cardinalDirection == newDirection ):
		return false
	else:
		cardinalDirection = direction
		return true
	

func updateAnimation() -> void:
	animationPlayer.play(state + AnimDirection())
	
	pass
	
func AnimDirection() -> String:
	match cardinalDirection:
		Vector2.DOWN:
			return "Down"
		Vector2.RIGHT:
			return "Right"
		Vector2.UP:
			return "Up"
		Vector2.LEFT:
			return "Left"
		Vector2.ZERO:
			return ""
		_:
			print("Something went wrong")
			return "Something went wrong"
	
	
	
	
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
