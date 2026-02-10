extends Control

func _ready():
	hide()  


func show_death_menu():
	show()
	get_tree().paused = true  


func hide_death_menu():
	hide()
	get_tree().paused = false


func _on_restart_pressed() -> void:
	get_tree().paused = false
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()  



func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
