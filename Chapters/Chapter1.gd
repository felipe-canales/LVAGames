extends Node2D

var nivel1 = "res://Chapters/Chapter1/level_01.tscn"
var nivel2 = "res://Chapters/Chapter1/level_02.tscn"
var nivel3 = "res://Chapters/Chapter1/level_03.tscn"
var nivel4 = "res://Chapters/Chapter1/level_04.tscn"
var nivel5 = "res://Chapters/Chapter1/level_05.tscn"

var cutscene1 = "res://Chapters/Chapter1/cutscene1.tscn"

var arreglo_niveles = [nivel1, nivel2, nivel5, nivel3, nivel4]
var arreglo_cutscenes = [null,null,cutscene1,null,null,null]

var actual_nivel
var num_nivel = 0

func set_level(num):
	
	num_nivel = num

func _ready():
	
	
	actual_nivel = arreglo_niveles[num_nivel]

func init_level():
	

	actual_nivel = arreglo_niveles[num_nivel]
	get_tree().change_scene(actual_nivel)

func up_nivel():
	# sig nivel
	num_nivel += 1
	
	if arreglo_cutscenes[num_nivel] != null:
		var cutscene = arreglo_cutscenes[num_nivel]
		arreglo_cutscenes[num_nivel] = null
		num_nivel -= 1
		get_tree().change_scene(cutscene)
		
	# si hay sig nivel
	elif num_nivel < len(arreglo_niveles):
		init_level()

		
	# fin del cap
	else:
		print("uwu")
		get_parent().up_chapter()
	
