extends Area2D

signal died


func _on_body_entered(body):
	died.emit()
	(body as CharacterBody2D).stop()
	get_tree().change_scene_to_file("res://Scene/restart/restart.tscn")
