extends TextureRect

var active = false

var image_salir = load("res://scripts/menu/salir.png")
var image_salir_ = load("res://scripts/menu/salir_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
		
func _process(delta):
	
	
	if active:
		
		set_texture(image_salir_)
	
	else:
		set_texture(image_salir)
