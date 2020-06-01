extends TextureRect

var active = false

var image_atras = load("res://scripts/chapterselect/atras.png")
var image_atras_ = load("res://scripts/chapterselect/atras_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_atras_)
	
	else:
		set_texture(image_atras)
