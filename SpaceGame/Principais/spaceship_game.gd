extends Node2D

var velBackGround = 27
var score : int = 000000
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var textureBackground = $Background
var Enemy = preload("res://SpaceGame/Inimigo/enemy_body.tscn")

func _ready() -> void:
	SpaceGameManager.gainScore.connect(_on_gain_score)


func _process(delta: float) -> void:
	#Movimentação do fundo
	textureBackground.TEXTURE_REPEAT_ENABLED
	textureBackground.position.y -= delta * velBackGround
	if(textureBackground.position.y <= -textureBackground.size.y/2):
		textureBackground.position.y = 0
	


#Spawner dos inimigos
func _on_timer_timeout() -> void:
	var enemy = Enemy.instantiate()
	var randomNumber = randi_range(278,854)
	enemy.position = Vector2(randomNumber,0)
	add_child(enemy)
	
	
	

#Atualizador Score
func _on_gain_score(newScore) -> void:
	score += newScore
	var stringScore : String = str(score)
	
	for i in range( 6 - stringScore.length()):
		stringScore = str(0) + stringScore
	
	score_label.text = stringScore
