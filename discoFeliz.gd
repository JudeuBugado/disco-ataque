extends KinematicBody2D

var velocidade = Vector2.ZERO
var direcao1 = Vector2.UP
var direcao2 = Vector2.LEFT
export var aceleracao = 2

func moviment():
	
	if direcao1 != Vector2.ZERO:
		velocidade = direcao1 * aceleracao + velocidade
	if direcao2 != Vector2.ZERO:
		velocidade = direcao2 * aceleracao + velocidade
	else:
		velocidade.x = 0
		velocidade.y = 0
	
func _physics_process(delta):
	moviment()
	velocidade = move_and_slide(velocidade)


func _on_Area2D_body_entered(body):
	direcao1 = direcao1 * -1
	direcao2 = direcao2 * -1
	pass # Replace with function body.


func _on_Area2DKILL_body_entered(body):
	body.player_morrer()
