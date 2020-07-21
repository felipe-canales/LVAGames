aextends Label


func _ready():
	pass # Replace with function body.


func change_color(condition):
	
	if condition:
	
		add_color_override("font_color", Color(255/255,192/255,203/255))

	
	else:
		add_color_override("font_color", Color(1,1,1))
		
