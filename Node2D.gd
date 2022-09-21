extends Node2D

const DISCO = preload("res://Disco.tscn")


func _on_TimerSpawn_timeout():
	var disco = DISCO.instance()
	get_parent().add_child(disco)
	print("aaaaaa")



