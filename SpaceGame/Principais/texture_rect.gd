extends TextureRect

var velocidade = 27

func _process(delta: float) -> void:
	
	texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
	
	position.y -= delta * velocidade 
	
	if position.y <= -size.y/2:
		position.y = 0
		
	
