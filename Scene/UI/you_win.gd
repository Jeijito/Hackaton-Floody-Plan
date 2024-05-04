extends Control


func _ready():
	$AnimationPlayer.play("blue")
	pass # Replace with function body.

func _on_restart_pressed():
	$AnimationPlayer.play_backwards("blue")
	get_tree().change_scene_to_file("res://Scene/Levels/level_1.tscn")

func _on_quit_pressed():
	$AnimationPlayer.play_backwards("blue")
	get_tree().change_scene_to_file("res://Scene/UI/main.tscn")
