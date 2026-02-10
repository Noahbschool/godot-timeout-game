extends Control

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_two.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_three.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
