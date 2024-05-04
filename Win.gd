extends Area2D

signal win

func _on_body_entered(body):
	win.emit()
	get_tree().change_scene_to_file("res://Scene/UI/you_win.tscn")
