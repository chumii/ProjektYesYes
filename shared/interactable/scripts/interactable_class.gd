class_name Interactable extends Area2D

@export var obj_name : String = ""
@export var look_at_text : String = ""

func _interact():
	print(obj_name)

func _look_at():
	print(look_at_text)

func _use():
	print("Benutze %s" % obj_name)

func _take():
	print("Nehme %s" % obj_name)
