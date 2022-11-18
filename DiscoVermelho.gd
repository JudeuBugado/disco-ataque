extends DiscoMaster

export (int) var Speed
onready var target = Global.posicao_atual

func move(delta):
	if target != null:
		var target_position = target.position.normalized()
		var direction = (target_position - position).normalized()
		var motion = direction * Speed * delta
		position += motion
		
	pass
	


#func _physics_process(delta):
	
	#move(delta)

#func _on_Vision_body_entered(body):
	#velocidade = (player.global_position - position).normalized() * 40
	#pass
