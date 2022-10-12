extends KinematicBody2D

var random = RandomNumberGenerator.new()
var velocidade = Vector2.ZERO
var direcao1 = Vector2.UP
export var aceleracao = 2

func _ready():
	random.randomize()
	position.x = random.randi_range(20,300)
	position.y = random.randi_range(15,150)
	
func moviment():
	
	if direcao1 != Vector2.ZERO:
		velocidade = direcao1 * aceleracao + velocidade
	else:
		velocidade.x = 0
		velocidade.y = 0
	
func _physics_process(delta):
	moviment()
	velocidade = move_and_slide(velocidade)


func _on_Area2D_body_entered(body):
	direcao1 = direcao1 * -1
	


func _on_Area2DKILL_body_entered(body):
	body.player_morrer()


func _on_RecoilSpawnDAV_timeout():
	get_node("/root/Node2D").SDisco()
	

func _on_selfDestruction_timeout():
	self.queue_free()
