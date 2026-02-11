extends Node

var remaining_time: float = 0.0
var paused: bool = false
var pause_bonus: float = 5.0

func start_level_timer(seconds: float) -> void:
	remaining_time = seconds
	paused = false
	get_tree().paused = false

func toggle_pause_with_bonus() -> void:
	remaining_time += pause_bonus
	paused = not paused
	get_tree().paused = paused

func set_paused(value: bool) -> void:
	paused = value
	get_tree().paused = paused

func tick(delta: float) -> bool:
	if paused:
		return false
	remaining_time -= delta
	return remaining_time <= 0.0
