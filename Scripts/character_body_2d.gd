extends CharacterBody2D


const speed = 300.0
var jump_velocity

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity
var alive = true
var jump_height = 65
var time_jump_apex = 0.35
var on_ground = false
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sounds = $jump_sounds

func _physics_process(delta):
	gravity = (2 * jump_height) / pow(time_jump_apex, 2)
	jump_velocity = gravity * time_jump_apex
	velocity.y += gravity * delta
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	# Add the gravity.

	# Handle jump.
	if Input.is_action_pressed("move_left") and alive:
		animated_sprite.flip_h = true
		velocity.x = -speed
		animated_sprite.play("run")
	elif Input.is_action_pressed("move_right") and alive:
		animated_sprite.flip_h = false
		velocity.x = speed
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
		velocity.x = 0
		
	if Input.is_action_just_pressed("jump") and alive:
		if on_ground:
			animated_sprite.play("jump")
			jump_sounds.play()
			velocity.y = -jump_velocity
			on_ground = false
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
	
func stop():
	animated_sprite.stop()
	gravity = 0
	alive = false
	velocity = Vector2.ZERO
	get_tree().change_scene_to_file("res://Scene/restart/restart.tscn")
