extends KinematicBody2D

enum {MOVE, DASH}

const dash_speed = 65
export var dash_duration = 0.3
var dash_direction = Vector2.ZERO
var is_dashing = false
var can_dash = true
var state



var direcao = Vector2.ZERO
var pontuacao = 0
var speed = 100


func _ready():
	Global.pontuacao = 0
	state = MOVE
	is_dashing = false


func get_input():
	
	direcao = Vector2()
	if Input.is_action_pressed("ui_up"):
		$Sprite.play("up")
		direcao += Vector2(0,-1)

	if Input.is_action_pressed("ui_down"):
		$Sprite.play("down")
		direcao += Vector2(0,1)

	if Input.is_action_pressed("ui_right"):
		$Sprite.play("right")
		direcao += Vector2(1,0)

	if Input.is_action_pressed("ui_left"):
		$Sprite.play("left")
		direcao += Vector2(-1,0)

	if Input.is_action_pressed("dash") && !is_dashing && can_dash:
		state = DASH
		is_dashing = true
		can_dash = false
		$DashTimer.start(dash_duration)
	
	direcao = direcao.normalized()


func _physics_process(delta):
	
		
	#print(state)
	match state:
		
		MOVE:
			get_input()
			estado_base()

		DASH:
			dash_state(delta)
	



func dash_state(delta):
	direcao = direcao * dash_speed * delta
	move()
	
func estado_base():
	move()

func move():
	#if direcao.length() > 0:
		#rotation = direcao.angle()
	
	var _aux = move_and_slide(direcao * speed)

func player_morrer():
	self.queue_free()
	if Global.pontuacao > Global.RecordPontuacao:
		Global.RecordPontuacao = Global.pontuacao
		
	assert(get_tree().change_scene("res://GAMEOVER.tscn") == OK)


func _on_TimerPontuao_timeout():
	Global.pontuacao += 1
	#print(String(Global.pontuacao) + "PONTOS")



func _on_DashTimer_timeout():
	state = MOVE
	is_dashing = false
	$Recoildash.start(1)
	


func _on_Recoildash_timeout():
	can_dash = true
