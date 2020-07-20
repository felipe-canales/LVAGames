extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var vida
export var vida_max
var color_i = color(,,,1)
var color_f = color(,,,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var lambda = vida/vida_max
	var new_color = color_i * lambda + color_f * (1 - lambda)
	set_color(new_color)
#	pass
