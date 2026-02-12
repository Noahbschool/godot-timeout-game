extends Path2D
class_name MonsterLevel3

@export var path_follow_2D : PathFollow2D
@export var next_scene : String = "res://scenes/game_over.tscn"

func _ready():
	move_tween()

func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, 82.0)

# connect AnimatableBody2D -> body_shape_entered
func _on_animatable_body_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene_to_file(next_scene)
