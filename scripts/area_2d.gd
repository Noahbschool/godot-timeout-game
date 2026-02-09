# res://scripts/area_2d.gd
extends Area2D

# Path to your death screen scene
@export var death_screen_scene: PackedScene

func _ready():
	# Connect the signal to this Area2D
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Only trigger for the player
	if body.is_in_group("player"):
		print("Player entered the death zone!")
		# Change to the death screen
		get_tree().change_scene_to("death_menu")
