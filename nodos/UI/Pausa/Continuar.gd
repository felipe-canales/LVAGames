extends TextureRect

var active = false

var image_continuar = load("res://Assets/UI/jugar.png")
var image_continuar_ =load("res://Assets/UI/jugar_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_continuar_)
	
	else:
		set_texture(image_continuar)
