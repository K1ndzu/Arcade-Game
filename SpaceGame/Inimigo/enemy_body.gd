extends CharacterBody2D

signal dead
var is_dead : bool = false
var scorePoint = 100
var speed = 3
@onready var areaCollision : Area2D = $Area2D
@onready var sprite = $AnimatedSprite2D
@export var limit : int = 1300

func _process(delta: float) -> void:
	
	position.y += speed  
	if(position.y > limit):
		self.queue_free()
		
func _ready() -> void:
	sprite.play("default")
	dead.connect(_on_dead)


func _on_dead():
	sprite.play("Death")
	speed = 0
	areaCollision.queue_free()
	await sprite.animation_finished
	self.queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Bullet")):
		SpaceGameManager.gainScore.emit(scorePoint)
		self.dead.emit()
		area.get_parent().queue_free()
		
