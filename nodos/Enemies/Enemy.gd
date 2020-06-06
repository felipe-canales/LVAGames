extends KinematicBody2D

var shooted = false
var destroyed = false
var scale_down = false
var scale_up = false

# Velocidad a la que se acerca el enemigo
var velocidad = 4000
# Distancia entre el enemigo y el player
var distancia = 200

export var vida = 3

var path := PoolVector2Array() setget set_path


# Por definir segun la agrupacion de nodos
onready var player = get_parent().get_parent().get_node("Player")


var movcont_x = 0
var movcont_y = 0

func _ready():
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
		
	move_and_slide(Vector2(movcont_x, movcont_y).normalized() * velocidad * delta)
	
	#move_along_path(velocidad)
	
func move_along_path(distance):
	
	var start_point = position

	for i in range(path.size()):
		var distance_to_next = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		elif distance < 0.0:
			
			position = path[0]
			set_process(false)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
	
func set_path(value : PoolVector2Array):
	
	path = value
	if value.size() == 0:
		return
	set_process(true)

func _on_Dao_area_entered(area:Area2D):
	if "Bullets" in area.get_groups():
		vida -= 1


func _on_Dao_body_entered(body):
	pass

