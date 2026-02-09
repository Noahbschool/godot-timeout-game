extends Control

func _ready():
	hide() 


func show_win_menu():
	show()
	get_tree().paused = true  # optional to pause game


func hide_win_menu():
	hide()
	get_tree().paused = false


func _on_next_level_pressed() -> void:
	get_tree().paused = false
	
	var current_scene = get_tree().current_scene
	var current_path = current_scene.filename
	
	
	var next_level_path = get_next_level_path(current_path)
	if next_level_path != "":
		get_tree().change_scene_to_file(next_level_path)
	else:
		print("No next level found. Returning to main menu.")
		get_tree().change_scene_to_file("res://ui/MainMenu.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")



func get_next_level_path(current_path: String) -> String:

	var levels = [
		"res://scenes/level_one.tscn",
		"res://scenes/level_two.tscn",
		"res://scenes/level_three.tscn"
	]

	var index = levels.find(current_path)
	if index == -1 or index + 1 >= levels.size():
		return "" 
	return levels[index + 1]
