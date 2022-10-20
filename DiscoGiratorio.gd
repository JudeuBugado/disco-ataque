extends DiscoMaster

var rotationSpeed = 2.0
var d = 0
var radius = 1
var speed = 10

func _ready():
	random.randomize()
	position.x = random.randi_range(90,320)
	position.y = random.randi_range(50,145)

	
func move(delta):
	
	d += delta
	radius += 1
	print(velocidade)
	velocidade = Vector2(
		sin(d * speed) * radius,
		cos(d * speed) * radius
	) 
	velocidade.x = clamp(velocidade.x, -100, 100)
	velocidade.y = clamp(velocidade.y, -100, 100)

func _physics_process(delta):
	move(delta)
	velocidade = move_and_slide(velocidade)

	
func _on_Area2D_body_entered(_body):
	direcao1 = direcao1 * -1
	direcao2 = direcao2 * -1
	

