extends CharacterBody2D

var scorePoint = 200
var speed = 3
@onready var sprite = $AnimatedSprite2D
@export var limit : int = 1300

func _process(delta: float) -> void:
	sprite.play("default")
	position.y += speed  
	if(position.y > limit):
		pass
