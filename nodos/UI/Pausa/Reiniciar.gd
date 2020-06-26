extends TextureRect

var active = false

var image_reinciar = load("res://Assets/UI/reiniciar.png")
var image_reiniciar_ =load("res://Assets/UI/reiniciar_.png")


func _ready():
	pass # Replace with function body.


func change_status(bol):
	
	active = bol
	
func _process(delta):
	
	
	if active:
		
		set_texture(image_reiniciar_)
	
	else:
		set_texture(image_reinciar)
