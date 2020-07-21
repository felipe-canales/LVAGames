extends Container

var chapter1 = "chapter1"
var chapter2 = "chapter2"
var chapter3 = "chapter3"
var atras = "atras"


var botones = [chapter1, chapter2, chapter3, atras]
var actual_boton = 0
var boton

const menu = "res://nodos/UI/MainMenu/MainMenu.tscn"
var chapter = preload("res://Chapters/Chapters.tscn")

func image_button(num):
	
	
	$"Capitulo1".change_status(0 == num)
	$"Capitulo2".change_status(1 == num)
	$"Capitulo3".change_status(2 == num)
	$"Atras".change_status(3 == num)


func _physics_process(delta):
	
	if Input.is_action_just_pressed("player_up"):
		
		actual_boton -= 1
		
	if Input.is_action_just_pressed("player_down"):
		
		actual_boton += 1
		
	actual_boton = actual_boton%len(botones)
	boton = botones[actual_boton]

	match boton:
		
		chapter1:
			
			image_button(0)
		chapter2:

			image_button(1)
		
		chapter3:
			
			image_button(2)
		atras:
			
			image_button(3)

			
	if Input.is_action_just_pressed("enter"):
		
		match boton:
			
			chapter1:
				
				var niv1 = chapter.instance()
				niv1.init(0)
				get_tree().get_root().add_child(niv1)
				
			chapter2:
				
				var niv2 = chapter.instance()
				niv2.init(1)
				get_tree().get_root().add_child(niv2)
				
			chapter3:
				
				var niv3 = chapter.instance()
				niv3.init(2)
				get_tree().get_root().add_child(niv3)
				
			atras:
				
				get_tree().change_scene(menu)
