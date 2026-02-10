extends Node2D

@export var scroll_speed := 120.0  # pixels per second

func _physics_process(delta: float) -> void:
	position.x += scroll_speed * delta
