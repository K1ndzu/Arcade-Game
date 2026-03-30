extends CharacterBody2D

signal dead

var amplitude = 448
var frequencia = 3
var oscilação : float
var tempo : float

var lives = 1
var type : String
var is_dead : bool = false
var scorePoint = 100
var speed = 3 + SpaceGameManager.emited*2
@onready var areaCollision : Area2D = $Area2D
@onready var sprite = $AnimatedSprite2D
@export var limit : int = 1300

func _process(delta: float) -> void:
	tempo += delta
	
	if(type != "Green"):
		position.y += speed
	else:
		oscilação = sin(tempo * frequencia) * amplitude
		global_position.x = 576 + oscilação
		position.y += speed
		
		




func _ready() -> void:
	var opcao = [frequencia, -frequencia]
	frequencia = opcao.pick_random()
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
		speed += 3
	elif(type == "Green"):
		speed -= SpaceGameManager.emited

func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if(area.is_in_group("Bullet")):
		lives -= 1
		area.get_parent().queue_free()
		if(lives <= 0):
			SpaceGameManager.gainScore.emit(scorePoint)
			self.dead.emit()
			
		
		
	

func _on_dead():
	sprite.play("Death")
	speed = 0
	areaCollision.queue_free()
	await sprite.animation_finished
	self.queue_free()
