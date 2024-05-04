extends Area2D

signal died


func _on_body_entered(body):
	died.emit()
	(body as CharacterBody2D).stop()
