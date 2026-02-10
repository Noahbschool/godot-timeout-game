extends Control

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS  # Always render while paused

func show_death_menu():
	show()
	get_tree().paused = true  # pause game but UI still works

func hide_death_menu():
	hide()
	get_tree().paused = false

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
