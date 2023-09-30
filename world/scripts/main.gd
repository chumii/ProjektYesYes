extends Node2D

@onready var tutorial_ui = $TutorialUi

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.connect("show_tutorial_ui", _show_tutorial_ui)
	GlobalSignals.connect("hide_tutorial_ui", _hide_tutorial_ui)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("esc"):
		get_tree().quit()

func _show_tutorial_ui():
	tutorial_ui.show()
	
func _hide_tutorial_ui():
	tutorial_ui.hide()
