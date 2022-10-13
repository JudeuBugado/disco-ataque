extends Node2D

const PONTO = preload("res://Pontos.tscn")
const GERENCIADOR = preload("res://GerenciadorDisco.tscn")

func _ready():
	pass


func SPonto():
	var ponto = PONTO.instance()
	self.add_child(ponto)


	
