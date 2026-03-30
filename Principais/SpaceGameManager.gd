extends Node

signal gainScore(points)
signal lives(increase)
signal timerDifficult
var time : float

func _process(delta: float) -> void:
	time += delta
	if(time >= 30):
		timerDifficult.emit()
	
