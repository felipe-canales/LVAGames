extends KinematicBody2D

var destroyed = false
var scale_down = false
var scale_up = false
var destruction_started = true

# Velocidad a la que se acerca el enemigo
var velocidad = 1000
# Distancia entre el enemigo y el player
var distancia = 200

# Por definir segun la agrupacion de nodos
onready var player = get_parent().get_parent().get_node("Player")


var movcont_x = 0
var movcont_y = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if destroyed:
		if destruction_started:
			destruction_started = false
		scale_down = true
		
	var dist = player.global_position.distance_to(global_position)
	var dir_x = player.global_position.x - global_position.x
	var dir_y = player.global_position.y - global_position.y
	
	if dist<distancia:
		movcont_x = dir_x
		movcont_y = dir_y
	else:
		movcont_x = 0
		movcont_y = 0
		
	move_and_slide(Vector2(movcont_x, movcont_y).normalized() * velocidad * delta)
