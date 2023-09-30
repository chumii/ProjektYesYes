class_name Interactable extends Area2D

@export var obj_name : String = ""
@export var look_at_text : String = ""
@export var is_npc : bool = false
@export var dialogue_res : DialogueResource
@export var dialogue_start : String = ""

func _interact():
	print(obj_name)

func _look_at():
	print(look_at_text)

func _use_speak():
	if is_npc:
		DialogueManager.show_example_dialogue_balloon(dialogue_res, dialogue_start)
	else:
		print("Benutze %s" % obj_name)

func _take():
	print("Nehme %s" % obj_name)
