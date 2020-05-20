extends TextureRect

var active = false

var image_jugar = load("res://scripts/menu/jugar.png")
var image_jugar_ = load("res://scripts/menu/jugar_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_jugar_)
	
	else:
		set_texture(image_jugar)
