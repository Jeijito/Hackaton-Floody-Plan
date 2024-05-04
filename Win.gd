extends Area2D

signal win

func _on_body_entered(body):
	win.emit()
	print("you win")
