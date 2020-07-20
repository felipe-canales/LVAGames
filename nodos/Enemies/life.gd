extends Node2D

export var vida = 10
export var vida_max = 10
var color_i = Color(248.0/255.0,97.0/255.0,90.0/255.0,0.8)
var color_f = Color(81.0/255.0,24.0/255.0,69.0/255.0,0.8)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var lambda = vida/vida_max
	var new_r = color_i.r * lambda + color_f.r * (1 - lambda)
	var new_g = color_i.g * lambda + color_f.g * (1 - lambda)
	var new_b = color_i.b * lambda + color_f.b * (1 - lambda)
	var v = get_node("vida")
	v.set_color(Color(new_r, new_g, new_b, 1))

func set_values(v_i):
	vida_max = v_i
	vida = v_i
	
func danio():
	vida =- 1
