extends TextureRect

var active = false

var image_jugar = load("res://scripts/jugar.png")
var image_jugar_ = load("res://scripts/jugar_.png")


func _ready():
	pass # Replace with function body.


func change_status():
	
	if active:
		active = false
	else:
		active = true
		
func _process(delta):
	
	
	if active:
		
		set_texture(image_jugar_)
	
	else:
		set_texture(image_jugar)
