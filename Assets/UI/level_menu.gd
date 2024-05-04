extends Control

var level2_passed = false
#func for the change of scene to level 1
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scene/Levels/level_1.tscn")

func _on_level_2_pressed():
	if level2_passed:
		print("playing level 2")
	else:
		get_tree().reload_current_scene() 
		
		
