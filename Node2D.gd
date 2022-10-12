extends Node2D

const DISCO = preload("res://Disco.tscn")
const PONTO = preload("res://Pontos.tscn")

func _ready():
	pass

func _on_TimerSpawn_timeout():
	SDisco()


func SPonto():
	var ponto = PONTO.instance()
	self.add_child(ponto)

func SDisco():
	var disco = DISCO.instance()
	self.add_child(disco)
