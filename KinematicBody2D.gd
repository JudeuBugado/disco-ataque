extends KinematicBody2D

var direcao = Vector2.ZERO
var pontuacao = 0
const DISCO = preload("res://Disco.tscn")

func _ready():
	Global.pontuacao = 0
	
func get_input():
	direcao = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		direcao += Vector2(0,-1)
		
	if Input.is_action_pressed("ui_down"):
		direcao += Vector2(0,1)
	
	if Input.is_action_pressed("ui_right"):
		direcao += Vector2(1,0)
	
	if Input.is_action_pressed("ui_left"):
		direcao += Vector2(-1,0)
	
	
func _physics_process(delta):
	
	get_input()
	if direcao.length() > 0:
		rotation = direcao.angle()
	
	#var look_direcao = global_position + direcao
	#var angle_to = get_angle_to(look_direcao)
	#var rot_direcao = sign(stepify(angle_to,0.1))
	
	#rotation += rot_direcao * delta * (PI*2)
	translate(direcao * 100 * delta)


func player_morrer():
	self.queue_free()
	if Global.pontuacao > Global.RecordPontuacao:
		Global.RecordPontuacao = Global.pontuacao
		
	get_tree().change_scene("res://GAMEOVER.tscn")


func _on_TimerPontuao_timeout():
	Global.pontuacao += 1
	#print(String(Global.pontuacao) + "PONTOS")





