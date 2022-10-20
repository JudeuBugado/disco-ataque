extends Node2D

onready var duration_time = $TimerDash
const dash_delay = 0.4

var can_dash = true 

func start_dash(duration):
	duration_time.wait_time = duration
	duration_time.start()
		
func is_dashing():
	return !duration_time.is_stopped()
	
	
func end_dash():
	can_dash = false
	yield(get_tree().create_timer(dash_delay),"timeout")
	can_dash = true

	



func _on_TimerDash_timeout():
	end_dash()
