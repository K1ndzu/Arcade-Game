extends CharacterBody2D

var teste = preload("res://FirstGame/Spaceship Game.tscn")
var speed = -15


func _physics_process(delta: float) -> void:
	move_and_slide()
func _process(delta: float) -> void:
	position.y += speed
	
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if(area.is_in_group("enemy")):
		area.get_parent().queue_free()
		self.queue_free()
		
		
