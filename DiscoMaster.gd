extends KinematicBody2D
class_name DiscoMaster

 
var random = RandomNumberGenerator.new()
var velocidade = Vector2.ZERO
var direcao1 = Vector2.UP
var direcao2 = Vector2.LEFT
export var aceleracao = 2
export var tempo = 5

func _ready():
	random.randomize()
	position.x = random.randi_range(35,60) -  Global.posicao.x
	position.y = random.randi_range(35,60) -  Global.posicao.y
	
func moviment():
	
	pass
	
func _physics_process(_delta):
	moviment()
	velocidade = move_and_slide(velocidade)


func _on_Area2D_body_entered(_body):
	pass 


func _on_Area2DKILL_body_entered(body):
	body.player_morrer()

	

func _on_selfDestruction_timeout():
	self.queue_free()
