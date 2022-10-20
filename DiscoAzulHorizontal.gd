extends DiscoMaster


func moviment():
	
	if direcao2 != Vector2.ZERO:
		velocidade = Vector2(-100, 0).rotated(direcao2.angle())
	else:
		velocidade.x = 0
		velocidade.y = 0

func _on_Area2D_body_entered(_body):
	direcao2 = direcao2 * -1
