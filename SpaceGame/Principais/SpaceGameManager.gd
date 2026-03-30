extends Node

var emited = 0
signal gainScore(points)
signal lives(increase)
signal timerDifficult
var time : float

func _process(delta: float) -> void:
	time += delta
	
	if(time >= 30):
		timerDifficult.emit()
		time = 0
		emited += 1
	
