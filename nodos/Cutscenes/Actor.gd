extends KinematicBody2D

var x_speed = 0
var y_speed = 0

func _ready():
	 pass
	
func _process(delta):
	self.position.x += x_speed * delta
	self.position.y += y_speed * delta
	#self.position.x

func move_x(speed):
	x_speed = speed

func move_y(speed):
	y_speed = speed
	
func stop():
	x_speed = 0
	y_speed = 0
	
func fade_in():
	# todo
	pass
	
func fade_out():
	# todo
	pass
