extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction
var vertDirection

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	_ProcessInput()

func _physics_process(delta):
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if vertDirection:
		velocity.y = vertDirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _ProcessInput():
	direction = Input.get_axis("move_left", "move_right")
	vertDirection = Input.get_axis("move_up", "move_down")