extends Node2D

var random = RandomNumberGenerator.new()

func _ready():
	random.randomize()
	position.x = random.randi_range(90,320)
	position.y = random.randi_range(50,145)

func spawnPonto():
	get_parent().SPonto()


func _on_Area2D_body_entered(_body):
	Global.pontuacao += 10
	self.queue_free()
	spawnPonto()


func _on_TimerFree_timeout():
	self.queue_free()
	spawnPonto()


func _on_Coliso_body_entered(_body):
	self.queue_free()
	spawnPonto()
