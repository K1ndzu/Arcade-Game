extends Label

class_name labelSpacing
@export var score = 100


func _process(delta: float) -> void:
	text = "Score :\n%d" % score
