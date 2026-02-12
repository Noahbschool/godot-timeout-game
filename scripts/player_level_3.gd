extends CharacterBody2D

@export var speed: float = 10.0
@export var jump_power: float = 10.0

var speed_multiplier: float = 30.0
var jump_multiplier: float = -40.0
var can_control: bool = true

@export var screen_margin := 8.0

@onready var animation_player = $Node2D/AnimationPlayer
@onready var sprite = $Node2D/Sprite2D


func _physics_process(delta: float) -> void:
	if not can_control:
		return

	camera(delta)

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_power * jump_multiplier

	# Movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()

	# Detect collision with TileMap2
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider.name == "TileMap2":
			die()

		if collider.get_parent() is Monster:
			die()

	update_animations(direction)


func update_animations(direction):
	var new_anim = ""

	if not is_on_floor():
		if velocity.y < 0:
			new_anim = "jump"
		else:
			new_anim = "fall"
	elif direction != 0:
		new_anim = "move"
	else:
		new_anim = "idle"

	if animation_player.current_animation != new_anim:
		if new_anim == "move":
			animation_player.play(new_anim, -1.0, 2.5)
		else:
			animation_player.play(new_anim)


func camera(_delta: float) -> void:
	var cam: Camera2D = get_viewport().get_camera_2d()
	if cam == null or not cam.enabled:
		return

	var vp_size: Vector2 = get_viewport_rect().size
	var half_world: Vector2 = (vp_size * 0.5) / cam.zoom

	var screen_rect: Rect2 = Rect2(
		cam.global_position - half_world,
		half_world * 2.0
	).grow(-screen_margin)

	if not screen_rect.has_point(global_position):
		die()


var is_dead := false

func die() -> void:
	if is_dead:
		return

	is_dead = true
	can_control = false

	if get_tree():
		get_tree().call_deferred("change_scene_to_file", "res://scenes/death_menu_level_3.tscn")
