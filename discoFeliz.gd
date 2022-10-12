<<<<<<< Updated upstream
extends KinematicBody2D
enum{DiscoFeliz,DiscoTriste,DiscoRaivoso}

var random = RandomNumberGenerator.new()
var velocidade = Vector2.ZERO
var direcao1 = Vector2.UP
var direcao2 = Vector2.LEFT
export var aceleracao = 2
var posicaoX

func _ready():
	random.randomize()
	position.x = random.randi_range(20,300)
	position.y = random.randi_range(15,150)
	match random.randi_range(0,3):
		0:
			continue
		1: 
			continue
		2:
			continue
	
=======
extends DiscoMaster

>>>>>>> Stashed changes
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


<<<<<<< Updated upstream
func _on_Area2DKILL_body_entered(body):
	body.player_morrer()

=======
>>>>>>> Stashed changes
