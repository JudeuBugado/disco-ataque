extends Control


func _ready():
	get_tree().paused = false
	hide()
	pass

func _process(delta):
	
	print(get_tree().paused)
	
	if Input.is_action_just_pressed("Pause"):
		print("a")
		if get_tree().paused == false:
			print("bbbbb")
			get_tree().paused = true
			show()
			

		else:
			get_tree().paused = false
			hide()
			
	
