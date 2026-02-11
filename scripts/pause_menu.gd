extends Control

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	
func resume() -> void:
	GameState.set_paused(false)

func pause() -> void:
	GameState.set_paused(true)

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_resume_pressed() -> void:
	resume()

var was_paused := false

func _process(_delta: float) -> void:
	if get_tree().paused != was_paused:
		was_paused = get_tree().paused
		if was_paused:
			visible = true
			$AnimationPlayer.play("blur")
		else:
			$AnimationPlayer.play_backwards("blur")
			visible = false
