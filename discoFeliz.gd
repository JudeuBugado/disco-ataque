extends DiscoMaster

func moviment():
	
	if direcao1 != Vector2.ZERO:
		velocidade = direcao1 * aceleracao + velocidade
	if direcao2 != Vector2.ZERO:
		velocidade = direcao2 * aceleracao + velocidade
	else:
		velocidade.x = 0
		velocidade.y = 0


func _on_Area2D_body_entered(body):
	direcao1 = direcao1 * -1
	direcao2 = direcao2 * -1


