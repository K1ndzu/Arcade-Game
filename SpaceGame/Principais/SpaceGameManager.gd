extends Node



var listLeaderboard = {}
var emited = 0
signal gameOver(Score)
signal gainScore(points)
signal lives(increase)
signal timerDifficult
var time : float

func _ready() -> void:
	gameOver.connect(inputLeaderboard)
	
	
func inputLeaderboard(score, username):
	listLeaderboard.append(score, username)
	


func _process(delta: float) -> void:
	time += delta
	
	
	if(time >= 30):
		timerDifficult.emit()
		time = 0
		emited += 1
	


func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://SpaceGame/Principais/Spaceship Game.tscn")
