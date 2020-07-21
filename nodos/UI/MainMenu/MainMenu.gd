extends Container

var jugar = "jugar"
var opciones = "opciones"
var seleccionar = "seleccionar"
var salir = "salir"

var botones = [jugar, seleccionar, opciones, salir]
var actual_boton = 0
var boton

const chapter = preload("res://Chapters/Chapters.tscn")
const select_chapter = "res://nodos/UI/ChapterSelect/ChapterSelect.tscn"
const creditos = "res://nodos/Ending/Creditos.tscn"

func _ready():
	pass 
	
func image_button(num):
	
	$"Jugar".change_status(0 == num)
	$"Seleccionar".change_status(1 == num)
	$"Opciones".change_status(2 == num)
	$"Salir".change_status(3 == num)
	
func _physics_process(delta):
	
	if Input.is_action_just_pressed("player_up"):
		
		actual_boton -= 1
		
	if Input.is_action_just_pressed("player_down"):
		
		actual_boton += 1
		
	actual_boton = actual_boton%len(botones)
	boton = botones[actual_boton]

	match boton:
		
		jugar:
			
			image_button(0)
		seleccionar:

			image_button(1)
		opciones:
			
			image_button(2)
		salir:
			
			image_button(3)
			
	if Input.is_action_just_pressed("enter"):
		
		match boton:
			
			jugar:
				
				var niv1 = chapter.instance()
				niv1.init(0,0)
				get_tree().get_root().add_child(niv1)
				
			seleccionar:
				
				get_tree().change_scene(select_chapter)
				
			opciones:
				get_tree().change_scene(creditos)
				
			salir:
				get_tree().quit()
