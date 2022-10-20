extends Node2D

var random = RandomNumberGenerator.new()
const DISCOFELIZ = preload("res://DiscoFeliz.tscn")
const DISCOAZULVERTICAL = preload("res://DiscoAzulVertical.tscn")
const DISCOAZULHORIZONTAL = preload("res://DiscoAzulHorizontal.tscn")
const DISCOVERDEG = preload("res://DiscoGiratorio.tscn")
const PONTO = preload("res://Pontos.tscn")

func _ready():
	SpawnDisco()
	SpawnDisco()
	
func SpawnDisco():
	match random.randi_range(0,3):
		
		0:
			var disco = DISCOFELIZ.instance()
			self.add_child(disco)
			$Timer.start(3)
			
		1: 
			var disco = DISCOAZULVERTICAL.instance()
			self.add_child(disco)
			$Timer.start(1)
			
		2: 
			var disco = DISCOAZULHORIZONTAL.instance()
			self.add_child(disco)
			$Timer.start(1)
		
		3:
			var disco = DISCOVERDEG.instance()
			self.add_child(disco)
			$Timer.start(3)

func _on_Timer_timeout():
	SpawnDisco()

func SPonto():
	var ponto = PONTO.instance()
	self.call_deferred("add_child", ponto)
