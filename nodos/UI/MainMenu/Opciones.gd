extends TextureRect

var active = false

var image_opciones = load("res://Assets/UI/UI_New/creditos.png")
var image_opciones_ = load("res://Assets/UI/UI_New/creditos_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	

	if active:
		
		set_texture(image_opciones_)
	
	else:
		set_texture(image_opciones)
