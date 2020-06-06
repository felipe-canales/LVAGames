extends KinematicBody2D

var shooted = false
var destroyed = false
var scale_down = false
var scale_up = false

var invincibility_timer = 0
export var INVINCIBILTY_TIME = 0.5

# Velocidad a la que se acerca el enemigo
var velocidad = 4000
# Distancia entre el enemigo y el player
var distancia = 200

export var life = 1

# Por definir segun la agrupacion de nodos
onready var player = get_parent().get_parent().get_node("Player")

var movcont_x = 0
var movcont_y = 0

func _ready():
	pass 

func _physics_process(delta):
	
	if life == 0:
			destroyed = true
			
	var dist = player.global_position.distance_to(global_position)
	var dir_x = player.global_position.x - global_position.x
	var dir_y = player.global_position.y - global_position.y
	
	if dist<distancia:
		
		movcont_x = -dir_x
		movcont_y = -dir_y
		player.be_heal()
		
	elif dist > distancia -  1 and dist < distancia +1:
		
		movcont_x = 0
		movcont_y = 0
		
	else:
		movcont_x = dir_x
		movcont_y = dir_y
		
	if invincibility_timer > 0:
		invincibility_timer -= delta
		if invincibility_timer <= 0:
			show()
			get_node("DamageArea/CollisionShape2D2").set_deferred("disabled",false)
		
	move_and_slide(Vector2(movcont_x, movcont_y).normalized() * velocidad * delta)
	
func be_damaged():
	invincibility_timer = INVINCIBILTY_TIME
	life -=1
	get_node("DamageArea/CollisionShape2D2").set_deferred("disabled",true)
	if life == 0:
		invincibility_timer = 0
		death()
		
func death():
	
	queue_free()

func _on_Dao_area_entered(area:Area2D):
	if "Bullets" in area.get_groups():
		life -= 1

func _on_DamageArea_body_entered(body:KinematicBody2D):

	if body != null:
		if body.get_name().begins_with("Enemy") and invincibility_timer <= 0:
			be_damaged()
