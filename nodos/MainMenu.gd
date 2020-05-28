extends MarginContainer

var jugar = "jugar"
var opciones = "opciones"
var salir = "salir"

var botones = [jugar, opciones, salir]
var actual_boton = 0
var boton

const chapter1 = preload("res://Chapters/Chapters.tscn")

func _ready():
	pass 

func _physics_process(delta):
	
	if Input.is_action_just_pressed("player_up"):
		
		actual_boton -= 1
		
	if Input.is_action_just_pressed("player_down"):
		
		actual_boton += 1
		
	actual_boton = actual_boton%len(botones)
	boton = botones[actual_boton]

	match boton:
		
		jugar:
			
			$"HBoxContainer/VBoxContainer/VBoxContainer/Jugar".change_status(true)
			$"HBoxContainer/VBoxContainer/VBoxContainer/Opciones".change_status(false)
			$"HBoxContainer/VBoxContainer/VBoxContainer/Salir".change_status(false)
		
		opciones:

			$"HBoxContainer/VBoxContainer/VBoxContainer/Opciones".change_status(true)
			$"HBoxContainer/VBoxContainer/VBoxContainer/Jugar".change_status(false)
			$"HBoxContainer/VBoxContainer/VBoxContainer/Salir".change_status(false)
			
		salir:
			
			$"HBoxContainer/VBoxContainer/VBoxContainer/Opciones".change_status(false)
			$"HBoxContainer/VBoxContainer/VBoxContainer/Jugar".change_status(false)
			$"HBoxContainer/VBoxContainer/VBoxContainer/Salir".change_status(true)
			
	if Input.is_action_just_pressed("enter"):
		
		match boton:
			
			jugar:
				var niv = chapter1.instance()
				get_tree().get_root().add_child(niv)
				
			opciones:
				pass
				
			salir:
				get_tree().quit()
