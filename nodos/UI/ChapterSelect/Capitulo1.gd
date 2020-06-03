extends TextureRect

var active = false

var image_chapter1 = load("res://Assets/UI/cap1.png")
var image_chapter1_ = load("res://Assets/UI/cap1_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_chapter1_)
	
	else:
		set_texture(image_chapter1)
