extends Node2D

var random = RandomNumberGenerator.new()
const DISCOFELIZ = preload("res://DiscoFeliz.tscn")
#const DISCOAZULVERTICAL = preload("res://DiscoAzulVertical.tscn")

func _ready():
	SpawnDisco()
	SpawnDisco()
	
func SpawnDisco():
	match random.randi_range(0,1):
		
		0:
			var disco = DISCOFELIZ.instance()
			self.add_child(disco)
			$Timer.start(8)
			
		#1: 
			#var disco = DISCOAZULVERTICAL.instance()
			#self.add_child(disco)
			#$Timer.start(2)


func _on_Timer_timeout():
	SpawnDisco()
