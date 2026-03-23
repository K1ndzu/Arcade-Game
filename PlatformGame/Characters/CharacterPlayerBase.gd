extends CharacterBody2D
class_name CharacterBase

@export var gravity = 100
@export var speed = 30
@export var Lives = 5

func aplicarGravidade(delta):
	velocity.y += delta * gravity
	
