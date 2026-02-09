extends Control

@onready var vbox = $VBoxContainer

func _ready():
	# Hide pause menu initially
	visible = false

	# Setup buttons
	for button in vbox.get_children():
		if button is Button:
			# Make text black
			button.add_theme_color_override("font_color", Color(0,0,0,1))

			# Create white background
			var style = StyleBoxFlat.new()
			style.bg_color = Color(1,1,1,1) # white
			style.corner_radius_top_left = 5
			style.corner_radius_top_right = 5
			style.corner_radius_bottom_left = 5
			style.corner_radius_bottom_right = 5

			# Apply background to all states
			button.add_theme_style_override("normal", style)
			button.add_theme_style_override("hover", style)
			button.add_theme_style_override("pressed", style)

			# Connect buttons
			if button.text == "Resume":
				button.pressed.connect(self, "_on_resume_pressed")
			elif button.text == "Quit":
				button.pressed.connect(self, "_on_quit_pressed")

func _process(delta):
	# Toggle pause menu with ESC
	if Input.is_action_just_pressed("ui_cancel"):
		visible = not visible
		get_tree().paused = visible

# Button callbacks
func _on_resume_pressed():
	visible = false
	get_tree().paused = false

func _on_quit_pressed():
	get_tree().quit()
