extends MarginContainer

var chapter1 = "chapter1"
var chapter2 = "chapter2"
var atras = "atras"


var botones = [chapter1, chapter2, atras]
var actual_boton = 0
var boton


const menu = "res://nodos/MainMenu.tscn"
var chapter = preload("res://Chapters/Chapters.tscn")

func _ready():
	pass 
	
func image_button(num):
	
	
	$"HBoxContainer/VBoxContainer/VBoxContainer/Capitulo1".change_status(0 == num)
	$"HBoxContainer/VBoxContainer/VBoxContainer/Capitulo2".change_status(1 == num)
	$"HBoxContainer/VBoxContainer/VBoxContainer/Atras".change_status(2 == num)


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
		atras:
			
			image_button(2)

			
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
				
			atras:
				
				get_tree().change_scene(menu)
