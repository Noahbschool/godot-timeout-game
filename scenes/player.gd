extends CharacterBody2D

@export var speed: float = 10.0
@export var jump_power: float = 10.0

var speed_multiplier: float = 30.0
var jump_multiplier: float = -40.0
<<<<<<< HEAD
<<<<<<< HEAD
=======
var can_control: bool = true
>>>>>>> parent of a332ed9 (reverted changed)
=======
>>>>>>> parent of c68f4dd (things gone)

@onready var animation_player = $Node2D/AnimationPlayer
@onready var sprite = $Node2D/Sprite2D

func _physics_process(delta: float) -> void:
<<<<<<< HEAD
<<<<<<< HEAD
=======
	if not can_control: return
>>>>>>> parent of a332ed9 (reverted changed)
=======
>>>>>>> parent of c68f4dd (things gone)
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
<<<<<<< HEAD
<<<<<<< HEAD
		if new_anim == "move":
			animation_player.play(new_anim, -1.0, 2.5) # 1.5 = 150% speed
		else:
			animation_player.play(new_anim)
<<<<<<< HEAD
<<<<<<< HEAD
=======
	
>>>>>>> parent of a332ed9 (reverted changed)
=======
>>>>>>> parent of c68f4dd (things gone)
=======
		animation_player.play(new_anim)
>>>>>>> parent of 99a8f76 (Merge branch 'main' of https://github.com/Noahbschool/godot-timeout-game)
=======
		animation_player.play(new_anim)
>>>>>>> parent of 91ee055 (added obstacles)
