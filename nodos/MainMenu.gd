extends MarginContainer

var jugar = "jugar"
var opciones = "opciones"
var seleccionar = "seleccionar"
var salir = "salir"

var botones = [jugar, seleccionar, opciones, salir]
var actual_boton = 0
var boton

const chapter = preload("res://Chapters/Chapters.tscn")
const select_chapter = "res://nodos/ChapterSelect.tscn"

func _ready():
	pass 
	
func image_button(num):
	
	
	$"HBoxContainer/VBoxContainer/VBoxContainer/Jugar".change_status(0 == num)
	$"HBoxContainer/VBoxContainer/VBoxContainer/Seleccionar".change_status(1 == num)
	$"HBoxContainer/VBoxContainer/VBoxContainer/Opciones".change_status(2 == num)
	$"HBoxContainer/VBoxContainer/VBoxContainer/Salir".change_status(3 == num)
	
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
				niv1.init(0)
				get_tree().get_root().add_child(niv1)
				
			seleccionar:
				
				get_tree().change_scene(select_chapter)
				
			opciones:
				pass
				
			salir:
				get_tree().quit()
