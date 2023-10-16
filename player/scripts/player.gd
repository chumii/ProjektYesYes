class_name MyPlayer extends CharacterBody2D

var input_movement = Vector2.ZERO
var speed = 100

@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@onready var interact_indicator = $InteractIndicator

var found_interactable_obj : bool = false
var current_interactable_obj : Interactable = null

func _ready():
	GlobalSignals.connect("interact_found", _interact_found)
	GlobalSignals.connect("interact_left", _interact_left)

func _process(delta):
	_move(delta)
	
func _move(delta):
	input_movement = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if input_movement != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_movement)
		animation_tree.set("parameters/Walk/blend_position", input_movement)
		animation_state.travel("Walk")
		velocity = input_movement * speed
	
	if input_movement == Vector2.ZERO:
		animation_state.travel("Idle")
		velocity = Vector2.ZERO
		
#	move_and_slide()
	move_and_collide(velocity * delta)
	

func _unhandled_input(event):
	#Look at
	if event.is_action_pressed("interact_look_at"):
		if found_interactable_obj:
			get_viewport().set_input_as_handled()
			current_interactable_obj._look_at()
		else:
			print("Hier ist nichts zum anschauen...")
	
	#Use
	if event.is_action_pressed("interact_use_speak"):
		if found_interactable_obj:
			get_viewport().set_input_as_handled()
			current_interactable_obj._use_speak()
		else:
			print("Hier ist nichts was ich benutzen kann...")
	
	#take
	if event.is_action_pressed("interact_take"):
		if found_interactable_obj:
			get_viewport().set_input_as_handled()
			current_interactable_obj._take()
		else:
			print("Hier ist nichts was ich nehmen kann...")
	

func _interact_found(obj):
	found_interactable_obj = true
	current_interactable_obj = obj
	interact_indicator.show()
	
func _interact_left():
	found_interactable_obj = false
	current_interactable_obj = null
	interact_indicator.hide()
	
func _interact():
	current_interactable_obj._look_at()
