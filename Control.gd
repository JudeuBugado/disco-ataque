extends Control


func _on_RESET_pressed():
	assert(get_tree().change_scene("res://Node2D.tscn") == OK)
	



func _on_MENU_pressed():
	assert(get_tree().change_scene("res://Menu.tscn") == OK)
