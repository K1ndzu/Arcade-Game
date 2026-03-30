extends CharacterBody2D

signal dead

var lives = 1
var type : String
var is_dead : bool = false
var scorePoint = 100
var speed = 3
@onready var areaCollision : Area2D = $Area2D
@onready var sprite = $AnimatedSprite2D
@export var limit : int = 1300

func _process(delta: float) -> void:
	if(type != "Green"):
		position.y += speed
	else:
		SpaceGameManager.positionPlayer.connect(playerPosition(x, y))
	if(position.y > limit):
		self.queue_free()
		




func _ready() -> void:
	var animation = randi_range(1,3)
	match animation:
		1:
			type = "Purple"
		2:
			type = "Yellow"
		3:
			type = "Green"
	specialMove()
	
	dead.connect(_on_dead)


func specialMove():
	sprite.play(type)
	if(type == "Purple"):
		lives = 2
	elif(type == "Yellow"):
		speed = 7

func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if(area.is_in_group("Bullet")):
		lives -= 1
		area.get_parent().queue_free()
		SpaceGameManager.gainScore.emit(scorePoint)
		if(lives <= 0):
			self.dead.emit()
		
		
	

func _on_dead():
	sprite.play("Death")
	speed = 0
	areaCollision.queue_free()
	await sprite.animation_finished
	self.queue_free()
