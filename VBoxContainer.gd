extends Container

var continuar = "continuar"
var opciones = "opciones"
var salir = "salir"

var botones = [continuar, opciones, salir]
var actual_boton = 0
var boton
var bull
onready var node = $".."
var escena_inicio = "res://nodos/MainMenu.tscn"

func _ready():
	actual_boton = 0
	
func _reset():
	actual_boton = 0
	
func set_bull(bullets):
	
	bull = bullets

func _physics_process(delta):
	
	
	if Input.is_action_just_pressed("player_up"):
		
		actual_boton -= 1
		
	if Input.is_action_just_pressed("player_down"):
		
		actual_boton += 1
		
	actual_boton = actual_boton%len(botones)
	boton = botones[actual_boton]

	match boton:
		
		continuar:
			
			$"Continuar".change_status(true)
			$"Opciones".change_status(false)
			$"Salir".change_status(false)
		
		opciones:

			$"Continuar".change_status(false)
			$"Opciones".change_status(true)
			$"Salir".change_status(false)
			
		salir:
			
			$"Continuar".change_status(false)
			$"Opciones".change_status(false)
			$"Salir".change_status(true)
			
	if Input.is_action_just_pressed("enter"):
		
		match boton:
			
			continuar:
				actual_boton = 0
				node._unpaused()
				
			opciones:
				pass
				
			salir:
				
				get_tree().paused = false
				get_tree().change_scene(escena_inicio)
