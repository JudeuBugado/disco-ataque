extends Node2D

const DISCO = preload("res://Disco.tscn")
const PONTO = preload("res://Pontos.tscn")
const GERENCIADOR = preload("res://GerenciadorDisco.tscn")

func _ready():
	pass

<<<<<<< Updated upstream
func _on_TimerSpawn_timeout():
	var disco = DISCO.instance()
	self.add_child(disco)
	print("aaaaaa")
=======
>>>>>>> Stashed changes

func SPonto():
	var ponto = PONTO.instance()
	self.add_child(ponto)

<<<<<<< Updated upstream
=======

	
>>>>>>> Stashed changes
