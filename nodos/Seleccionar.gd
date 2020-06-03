extends TextureRect

var active = false

var image_seleccionar = load("res://Assets/UI/capitulos.png")
var image_seleccionar_ = load("res://Assets/UI/capitulos_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_seleccionar_)
	
	else:
		set_texture(image_seleccionar)
