extends CharacterBody2D

var input_movement = Vector2.ZERO
var speed = 100

@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

func _process(delta):
	_move()

func _move():
	input_movement = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if input_movement != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_movement)
		animation_tree.set("parameters/Walk/blend_position", input_movement)
		animation_state.travel("Walk")
		velocity = input_movement * speed
	
	if input_movement == Vector2.ZERO:
		animation_state.travel("Idle")
		velocity = Vector2.ZERO
		
	move_and_slide()
