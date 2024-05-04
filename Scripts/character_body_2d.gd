extends CharacterBody2D

const speed = 300 #speed when moving in the x-axis
var jump_velocity #velocity when it goes up in the y-axis
var gravity #velocity when it goes down in the y-axis
var jump_height = 75
var time_jump_apex = 0.35

@onready var animated_sprite = $AnimatedSprite2D #call of the sprite into code
@onready var jump_sounds = $jump_sounds

var alive = true #alive
var direction

func _physics_process(delta):
	gravity = (2 * jump_height) / pow(time_jump_apex, 2)
	jump_velocity = gravity * time_jump_apex
	
	if !is_on_floor(): #check if character is over a platform so gravity can be applied
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor() and alive: #check if it is over a platform so player can do a jump, if it is jump force is applied
		velocity.y = -jump_velocity
		jump_sounds.play()
	
	if alive:
		direction = Input.get_axis("move_left", "move_right") #direction is a number 1 or -1 depeding if "left", "right" or no keys are pressed
	
	if direction > 0 and alive: #Changes direction of the sprite depending on which direction you are going
		animated_sprite.flip_h = false
	elif direction < 0 and alive:
		animated_sprite.flip_h = true
	
	if is_on_floor() and alive: #if it is over a surface and it is not moving it plays idle else it plays runs else it plays jump animation
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
		
	if direction and alive: #if direction is true then if you are not over a floor it goes slower but if you are it goes faster(the change on the x-axis)  
		if !is_on_floor(): 
			velocity.x = direction * speed * .7
		else:
			velocity.x = direction * speed
	else: #else it assigns velocity to 0
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide() #THIS LET THE CHARACTER TO MOVE!!!
	
	
func stop():
	animated_sprite.stop()
	gravity = 0
	alive = false
	velocity = Vector2.ZERO
	get_tree().change_scene_to_file("res://Scene/restart/restart.tscn")
