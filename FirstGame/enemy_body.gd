extends CharacterBody2D

var scorePoint = 200
var speed = 3
@onready var sprite = $AnimatedSprite2D
@onready var area = $Area2D
var bullet = preload("res://FirstGame/bullet.tscn")

func _process(delta: float) -> void:
	sprite.play("default")
	position.y += speed  
	
