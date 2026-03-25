extends Node

var score = 0

signal scoreUpdate(score)

func addScore(value: int):
	score += value
	scoreUpdate.emit(score)
	
func resetScore():
	score = 0
	scoreUpdate.emit(score)
	
