extends Area2D

# Connected via editor: body_entered → _on_body_entered
func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player hit the death zone!")
		
		# Reference the existing DeathMenu node in the scene
		var death_menu = get_tree().current_scene.get_node("DeathMenu")
		if death_menu:
			death_menu.show_death_menu()
