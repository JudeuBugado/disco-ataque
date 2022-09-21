extends KinematicBody2D

var velocidade = Vector2.ZERO
var direcao = Vector2.ZERO
var pontuacao = 0
export var aceleracao =2
const DISCO = preload("res://Disco.tscn")

func _ready():
	Global.pontuacao = 0
	
func get_input():
	direcao.y = int(Input.is_action_pressed("ui_down"))-int(Input.is_action_pressed("ui_up"))
	direcao.x = int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	
	if direcao != Vector2.ZERO:
		velocidade=direcao*aceleracao+velocidade
	else:
		velocidade.x=0
		velocidade.y=0
	#print(velocidade)
func _physics_process(delta):
	get_input()
	velocidade = move_and_slide(velocidade)

func player_morrer():
	$".".queue_free()
	if Global.pontuacao > Global.RecordPontuacao:
		Global.RecordPontuacao = Global.pontuacao
		
	get_tree().change_scene("res://GAMEOVER.tscn")


func _on_TimerPontuao_timeout():
	Global.pontuacao += 1
	#print(String(Global.pontuacao) + "PONTOS")





