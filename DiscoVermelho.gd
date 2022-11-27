extends DiscoMaster

export (int) var Speed = 100

var velocity = Vector2()


	


func _physics_process(delta):
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position).normalized()
		
	global_position += velocity * Speed * delta



