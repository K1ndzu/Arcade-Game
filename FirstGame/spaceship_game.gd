extends Node2D

var score : int = 0
@onready var label = $ScoreLabel
var Enemy = preload("res://FirstGame/enemy_body.tscn")


func updateScore:
	label.text = score


func _on_timer_timeout() -> void:
	var enemy = Enemy.instantiate()
	var randomNumber = randi_range(278,854)
	enemy.position = Vector2(randomNumber,0)
	add_child(enemy)
	
	
	
