extends Interactable

func _on_body_entered(body):
	if body is MyPlayer:
		GlobalSignals.emit_signal("interact_found", self)

func _on_body_exited(body):
	if body is MyPlayer:
		GlobalSignals.emit_signal("interact_left")
