extends Container

var nivel1 = "nivel1"
var nivel2 = "nivel2"

var atras = "atras"
var chapter = preload("res://Chapters/Chapters.tscn")
var atras_escena = "res://nodos/UI/ChapterSelect/ChapterSelect.tscn"
var cap_actual

var boton_actual = 0

var opcion

var botones = [nivel1, nivel2 , atras]

func _physics_process(delta):
	
	if Input.is_action_just_pressed("player_right"):

		if boton_actual == 0:
			boton_actual = 1
			
		elif boton_actual == 1:
			boton_actual = 0
	
	if Input.is_action_just_pressed("player_left"):
		
		if boton_actual == 0:
			boton_actual = 1
			
		elif boton_actual == 1:
			boton_actual = 0
			
	if Input.is_action_just_pressed("player_down"):
		
		if boton_actual == 0 or boton_actual == 1:
			boton_actual = 2
		else:
			boton_actual = 0

			
	if Input.is_action_just_pressed("player_up"):
		
		if boton_actual == 0 or boton_actual == 1:
			boton_actual = 2
		else:
			boton_actual = 0


	boton_actual = boton_actual % len(botones)

	
	$Nivel1.change_color(boton_actual == 0)
	$Nivel2.change_color(boton_actual == 1)
	$Atras.change_color(boton_actual == 2)
	
	opcion = botones[boton_actual]
	
	if Input.is_action_just_pressed("pausa"):
		
		get_tree().change_scene(atras_escena)
	
	if Input.is_action_just_pressed("enter"):
		match opcion:
			nivel1:
				
				var chap = chapter.instance()
				chap.init(2,0)
				get_tree().get_root().add_child(chap)
			nivel2:
				
				var chap = chapter.instance()
				chap.init(2,1)
				get_tree().get_root().add_child(chap)
				
			atras:
				
				get_tree().change_scene(atras_escena)

