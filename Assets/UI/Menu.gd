extends Control


#func for the change of scene to the level menu
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/UI/level_menu.tscn")


#exits the game
func _on_quit_pressed():
	get_tree().quit()
