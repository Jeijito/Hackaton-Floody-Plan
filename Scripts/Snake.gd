extends Node2D

const speed = 60  # Speed of movement
var direction = 1  # Movement direction: 1 for right, -1 for left
var initial_position: Vector2  # Initial position 
var distance_traveled = 0.0  #distance traveled
@onready var animated_sprite_2d = $AnimatedSprite2D


func _ready(): # Save the initial position
	initial_position = position

func _process(delta):
	# Calculate the movement based on speed and direction and then update the distace traveled
	var movement = speed * direction * delta
	position.x += movement
	distance_traveled += abs(movement)

	if distance_traveled >= 100: # Check if the node has traveled 100 units and then change it to go the other way
		direction *= -1
		distance_traveled = 0
		
	if direction > 0: #Changes direction of the sprite depending on which direction it is going
		animated_sprite_2d.flip_h = true
	elif direction < 0:
		animated_sprite_2d.flip_h = false
