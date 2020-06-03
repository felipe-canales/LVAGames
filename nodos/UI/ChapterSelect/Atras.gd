extends TextureRect

var active = false

var image_atras = load("res://Assets/UI/atras.png")
var image_atras_ = load("res://Assets/UI/atras_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_atras_)
	
	else:
		set_texture(image_atras)
