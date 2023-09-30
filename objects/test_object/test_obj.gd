extends Interactable

func _on_body_entered(body):
	if body is MyPlayer:
		GlobalSignals.emit_signal("interact_found", self)
		GlobalSignals.emit_signal("show_tutorial_ui")

func _on_body_exited(body):
	if body is MyPlayer:
		GlobalSignals.emit_signal("interact_left")
		GlobalSignals.emit_signal("hide_tutorial_ui")
