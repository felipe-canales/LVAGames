extends Label


func _ready():
	pass


func change_color(condition):
	
	if condition:
	
		add_color_override("font_color", Color(float(198)/float(255),float(136)/float(255),float(174)/float(255)))
		get_children()[0].add_color_override("font_color", Color(float(198)/float(255),float(136)/float(255),float(174)/float(255)))
	
	else:
		add_color_override("font_color", Color(1,1,1))
		get_children()[0].add_color_override("font_color", Color(1,1,1))
