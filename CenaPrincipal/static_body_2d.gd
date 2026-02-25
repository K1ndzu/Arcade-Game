extends StaticBody2D

@onready var label = $Label
var myBoolean : bool = false
var count = 0
var text : String = "オタクになって言葉を翻訳するのはやめてください、何ですって。"

func _on_area_2d_body_entered(body: Node2D) -> void:
	myBoolean = true
	label.text = text
	label.global_position.y = self.global_position.y -39
	label.global_position.x = self.global_position.x - label.size.x/2
	
	
	label.show()
	
func _process(delta: float) -> void:
	if(myBoolean == true && Input.is_action_just_pressed("interact")):
		count +=1
		text = "Obrigado, estava com uma mega tosse aperte E novamente"
		label.text = "Obrigado, estava com uma mega tosse aperte E novamente"
		if(Input.is_action_just_pressed("interact") && count == 2):
			get_tree().change_scene_to_file("res://FirstGame/Spaceship Game.tscn")
		
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	myBoolean = false
	label.hide()
