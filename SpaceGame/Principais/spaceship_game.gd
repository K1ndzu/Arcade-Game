extends Node2D

var score : int = 100
var Enemy = preload("res://SpaceGame/Inimigo/enemy_body.tscn")
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var textureBackground = $TextureRect




signal gainScore(points)
 

func _ready() -> void:
	
	self.gainScore.connect(_on_gain_score)


func _on_timer_timeout() -> void:
	var enemy = Enemy.instantiate()
	var randomNumber = randi_range(278,854)
	enemy.position = Vector2(randomNumber,0)
	add_child(enemy)
	


func _on_gain_score(newScore) -> void:
	score += newScore
	score_label.text = str(score)
	
