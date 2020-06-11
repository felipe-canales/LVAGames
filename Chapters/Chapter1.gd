extends Node2D

var nivel1 = "res://Chapters/Chapter1/level_01.tscn"
var nivel2 = "res://Chapters/Chapter1/level_02.tscn"
var nivel3 = "res://Chapters/Chapter1/level_03.tscn"
var nivel4 = "res://Chapters/Chapter1/level_04.tscn"
var nivel5 = "res://Chapters/Chapter1/level_05.tscn"

var arreglo_niveles = [nivel1, nivel2, nivel5, nivel3, nivel4]

var actual_nivel
var num_nivel 


func _ready():
	
	num_nivel = 0
	actual_nivel = arreglo_niveles[num_nivel]

func init_level():
	

	actual_nivel = arreglo_niveles[num_nivel]
	get_tree().change_scene(actual_nivel)

	
func up_nivel():
	
	num_nivel += 1
	if num_nivel < len(arreglo_niveles):

		actual_nivel = arreglo_niveles[num_nivel]
		get_tree().change_scene(actual_nivel)
	else:
		print("uwu")
		get_parent().up_chapter()
	
func _process(delta):
	
	pass

