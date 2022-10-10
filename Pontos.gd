extends Node2D

var random = RandomNumberGenerator.new()

func _ready():
	random.randomize()
	position.x = random.randi_range(20,300)
	position.y = random.randi_range(15,150)

func spawnPonto():
	get_parent().SPonto()


func _on_Area2D_body_entered(body):
	Global.pontuacao += 10
	self.queue_free()
	spawnPonto()


func _on_TimerFree_timeout():
	self.queue_free()
	spawnPonto()
