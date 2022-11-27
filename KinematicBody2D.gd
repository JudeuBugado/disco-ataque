extends KinematicBody2D

enum {MOVE, DASH}

const dash_speed = 65
export var dash_duration = 0.3
var dash_direction = Vector2.ZERO
var is_dashing = false
var can_dash = true
var state
var state_Standard_Sprite



var direcao = Vector2.ZERO
var pontuacao = 0
var speed = 100
var posicao


func _ready():
	Global.pontuacao = 0
	state = MOVE
	is_dashing = false
	Global.player = self
	
func _exit_tree():
	Global.player = null


func get_input():
	
	direcao = Vector2()
	if Input.is_action_pressed("ui_up"):
		$Sprite.play("up")
		direcao += Vector2(0,-1)
		state_Standard_Sprite = 0;

	if Input.is_action_pressed("ui_down"):
		$Sprite.play("down")
		direcao += Vector2(0,1)
		state_Standard_Sprite = 1;

	if Input.is_action_pressed("ui_right"):
		$Sprite.play("left")
		$Sprite.flip_h = true
		direcao += Vector2(1,0)
		state_Standard_Sprite = 2;

	if Input.is_action_pressed("ui_left"):
		$Sprite.play("left")
		$Sprite.flip_h = false
		direcao += Vector2(-1,0)
		state_Standard_Sprite = 3;

	if Input.is_action_pressed("dash") && !is_dashing && can_dash:
		state = DASH
		is_dashing = true
		can_dash = false
		$DashTimer.start(dash_duration)
	
	direcao = direcao.normalized()
	
	if direcao == Vector2(0,0):
		match state_Standard_Sprite:
			
			0:
				$Sprite.play("standard up")
			
			1: 
				$Sprite.play("standard down")
				
			2: 
				$Sprite.play("standard left")
			
			3: 
				$Sprite.play("standard left")


func _physics_process(delta):
	Global.posicao = $NotSpawn.rect_position
	Global.posicao_atual = global_position
		
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




func _on_DashTimer_timeout():
	state = MOVE
	is_dashing = false
	$Recoildash.start(1)
	


func _on_Recoildash_timeout():
	can_dash = true


func _on_TimerPontuacao_timeout():
	Global.pontuacao += 1
