extends TextureRect

var active = false

var image_chapter2 = load("res://Assets/UI/cap2.png")
var image_chapter2_ = load("res://Assets/UI/cap2_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_chapter2_)
	
	else:
		set_texture(image_chapter2)