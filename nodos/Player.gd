extends KinematicBody2D

export var vida = 100
var vel = Vector2(0,0)
const TARGET_AXIS = 200
const TARGET_DIAG = TARGET_AXIS / 1.41
const ACCEL = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var target_x = 0
	var target_y = 0
	# Set direction
	if Input.is_action_pressed("player_right"):
		target_x += 1
	if Input.is_action_pressed("player_left"):
		target_x -= 1
	if Input.is_action_pressed("player_down"):
		target_y += 1
	if Input.is_action_pressed("player_up"):
		target_y -= 1
	# Higher speed if not moving diagonally
	if (target_x and target_y):
		target_x *= TARGET_DIAG
		target_y *= TARGET_DIAG
	else:
		target_x *= TARGET_AXIS
		target_y *= TARGET_AXIS
	# Moving
	vel.x = lerp(vel.x, target_x, ACCEL)
	vel.y = lerp(vel.y, target_y, ACCEL)
	move_and_slide(vel)


func _on_Area2D_body_entered(body):

	if body.get_name().begins_with("Enemy"):
		vida -=1
		print(vida)
