extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("blue")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_pressed():
	$AnimationPlayer.play_backwards("blue")
	get_tree().change_scene_to_file("res://Scene/Levels/level_1.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	$AnimationPlayer.play_backwards("blue")
	get_tree().change_scene_to_file("res://Scene/UI/main.tscn")
	pass # Replace with function body.
