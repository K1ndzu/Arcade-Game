extends Node2D

var velBackGround = 27
var lives: int = 2 
var score : int = 000000
var timerDifficult : Timer

var time = 0.5
@onready var spawner: Timer = $SpawnerTime
@onready var lives_label = $CanvasLayer/LivesNumber
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var textureBackground = $Background
@onready var over_label = $"CanvasLayer/GAME OVER"
@onready var enemies = $EnemyBody
var Enemy = preload("res://SpaceGame/Inimigo/enemy_body.tscn")
var Player = preload("res://SpaceGame/Personagem/character_body_2d.tscn")


func _ready() -> void:
	SpaceGameManager.timerDifficult.connect(increaseDifficult)
	SpaceGameManager.gainScore.connect(_on_gain_score)
	SpaceGameManager.lives.connect(_on_gain_lives)


func _process(delta: float) -> void:
	#Movimentação do fundo
	textureBackground.TEXTURE_REPEAT_ENABLED
	textureBackground.position.y -= delta * velBackGround
	if(textureBackground.position.y <= -textureBackground.size.y/3):
		textureBackground.position.y = 0
	

func increaseDifficult():
	time = max(time-0.025,0.2)
	spawner.start(time)
	
#Spawner dos inimigos
func _on_timer_timeout() -> void:
	var enemy = Enemy.instantiate()
	var randomNumber = randi_range(128,1024)
	enemy.position = Vector2(randomNumber,0)
	add_child(enemy)


#Atualizador Score
func _on_gain_score(newScore) -> void:
	score += newScore
	var stringScore : String = str(score)
	
	for i in range( 6 - stringScore.length()):
		stringScore = str(0) + stringScore
	
	score_label.text = stringScore
	
func _on_gain_lives(increase):
	lives += increase
	if(lives >= 0):
		var player = Player.instantiate()
		player.position = Vector2(576.0,616.0)
		add_child(player)
		lives_label.text = "0" + str(lives)
	else:
		over_label.visible = true
	
	
	
	
