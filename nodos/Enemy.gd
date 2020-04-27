extends KinematicBody2D

var destroyed = false
var scale_down = false
var scale_up = false
var destruction_started = true

# Velocidad a la que se acerca el enemigo
var velocidad = 100
# Distancia entre el enemigo y el player
var distancia = 250

onready var player = get_parent().get_parent().get_node("Player")

var movcont = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if destroyed:
		if destruction_started:
			destruction_started = false
		scale_down = true
		
	var dist = player.global_position.distance_to(global_position)
	var dir = player.global_position.x - global_position.x
	if dist<distancia:
		if movcont == 0:
			movcont = dir 
	move_and_collide(Vector2(movcont, 0).normalized() * velocidad * delta)
