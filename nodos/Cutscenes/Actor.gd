extends KinematicBody2D

var x_speed = 0
var y_speed = 0
var fading = 0 # no: 0, in: 1, out: 2
var fade_step = 0.0
var alpha

func _ready():
	if self.visible:
		alpha = 1.0
	else:
		alpha = 0.0
	self.get_material().set_shader_param("alpha", alpha)
	
func _process(delta):
	# moving
	self.position.x += x_speed * delta
	self.position.y += y_speed * delta
	# fading
	alpha += fade_step * delta
	if fading == 1 and alpha >= 1.0:
		fading = 0
		fade_step = 0.0
	elif fading == 2 and alpha <= 0.0:
		fading = 0
		fade_step = 0.0
		self.visible = false
	else:
		self.get_material().set_shader_param("alpha", alpha)

func move_x(speed):
	x_speed = speed

func move_y(speed):
	y_speed = speed
	
func stop():
	x_speed = 0
	y_speed = 0
	
func fade_in(time):
	if alpha < 1.0:
		self.visible = true
		fade_step = 1.0/time
		fading = 1
	
func fade_out(time):
	if alpha > 0.0:
		fade_step = -1.0/time
		fading = 2
