extends Node

@export var level_time := 30.0
@export var win_scene: PackedScene

func _ready() -> void:
	GameState.start_level_timer(level_time)

func _physics_process(delta: float) -> void:
	if GameState.tick(delta):
		get_tree().paused = false
		get_tree().change_scene_to_packed(win_scene)


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		GameState.toggle_pause_with_bonus()

@onready var time_label: Label = $CanvasLayer/TimeLabel

func _process(_delta: float) -> void:
	time_label.text = str(int(ceil(GameState.remaining_time)))
