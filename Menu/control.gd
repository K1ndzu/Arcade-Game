extends Control

@onready var sound = $StartSoundEffect


func _on_button_button_up() -> void:
	sound.play()
	await sound.finished
	
	get_tree().change_scene_to_file("res://SpaceGame/Principais/Spaceship Game.tscn")
	
