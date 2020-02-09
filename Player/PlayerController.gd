extends KinematicBody2D

export (int) var speed = 200
export (int) var jumpSpeed = 700

const GRAVITY_VECTOR = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)

var velocity = Vector2()

func get_input():
	
	velocity.x = 0

	var left = Input.is_action_pressed('left')
	var right = Input.is_action_pressed('right')
	var jump = Input.is_action_just_pressed('jump')
	
	if (is_on_floor() and jump):
		velocity.y = -jumpSpeed
	if (left):
		velocity.x -= speed
	if (right):
		velocity.x += speed
		
func _physics_process(delta):

	velocity = move_and_slide(velocity, FLOOR_NORMAL)

	get_input()

	velocity += GRAVITY_VECTOR * delta
