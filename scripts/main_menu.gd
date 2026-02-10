extends Control

func _on_levels_pressed():
	get_tree().change_scene_to_file("res://scenes/level_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
