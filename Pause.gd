extends Control


func _ready():
	get_tree().paused = false
	hide()
	

func _process(_delta):
	
	
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			show()
			

		else:
			get_tree().paused = false
			hide()
			
	
