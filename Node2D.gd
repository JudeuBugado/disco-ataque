extends Node2D

const DISCO = preload("res://Disco.tscn")
const PONTO = preload("res://Pontos.tscn")

func _ready():
	SPonto()

func _on_TimerSpawn_timeout():
	var disco = DISCO.instance()
	self.add_child(disco)
	print("aaaaaa")

func SPonto():
	var ponto = PONTO.instance()
	self.add_child(ponto)

