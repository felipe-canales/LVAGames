extends KinematicBody2D

var shooted = false
var destroyed = false
var scale_down = false
var scale_up = false

# Velocidad a la que se acerca el enemigo
var velocidad = 2500
# Distancia entre el enemigo y el player
var distancia = 200

onready var img_vida = get_node("Vida")

export var vida = 3

onready var animated_sprite:AnimatedSprite = $AnimatedSprite

# Por definir segun la agrupacion de nodos
onready var player = get_parent().get_parent().get_node("Player")

var movcont_x = 0
var movcont_y = 0

func _ready():
	img_vida.set_values(vida)
	pass 

func _process(delta):
	
	if vida == 0:
			destroyed = true

	var dist = player.global_position.distance_to(global_position)
	var dir_x = player.global_position.x - global_position.x
	var dir_y = player.global_position.y - global_position.y
	
	if dist<distancia:
		movcont_x = dir_x
		movcont_y = dir_y
	else:
		movcont_x = 0
		movcont_y = 0
	
	if dir_x*dir_x > dir_y*dir_y:
		
		animated_sprite.set_animation("side")
		
	else:
		animated_sprite.set_animation("front")
		
		

	move_and_slide(Vector2(movcont_x, movcont_y).normalized() * velocidad * delta)
	
func _on_Dao_area_entered(area:Area2D):
	if "Bullets" in area.get_groups():
		vida -= 1
		img_vida.danio()

func _on_Dao_body_entered(body):
	pass
