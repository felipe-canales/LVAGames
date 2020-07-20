extends Node2D

var nivel1 = "res://Chapters/Chapter2/level_3-01.tscn"
#var nivel2 = "res://Chapters/Chapter2/level_02-2.tscn"
#var nivel3 = "res://Chapters/Chapter2/level_03-2.tscn"
#var nivel4 = "res://Chapters/Chapter2/level_04-2.tscn"
#var nivel5 = "res://Chapters/Chapter2/level_05-2.tscn"
#var test = "res://Chapters/Chapter2/level_test_2.tscn"

var arreglo_niveles = [nivel1]#, nivel2, nivel3, nivel4, nivel5]

var actual_nivel
var num_nivel

# Called when the node enters the scene tree for the first time.
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
		get_parent().up_chapter()
	
func _process(delta):
	
	pass
