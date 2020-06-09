extends KinematicBody2D

var shooted = false
var destroyed = false
var scale_down = false
var scale_up = false
var charger = false

var invincibility_timer = 0
export var INVINCIBILTY_TIME = 0.5

var time_charge = 0
var time_wait_charge = 0

var time_exploted = 0

var TIME_CHARGER = 2
# Velocidad a la que se acerca el enemigo
var velocidad = 4000
# Distancia entre el enemigo y el player
var distancia_seguimiento = 400
var distancia_ataque = 200

export var life = 1

var attack = false

# Por definir segun la agrupacion de nodos
onready var player = get_parent().get_parent().get_node("Player")


onready var animated_sprite:AnimatedSprite = $AnimatedSprite

var exploted = false

var movcont_x = 0
var movcont_y = 0

var dir_charger_x
var dir_charger_y

func _ready():
	
	var gun = get_tree().get_nodes_in_group("Gun")
	animated_sprite.set_animation("stand")


func _physics_process(delta):
	

	if life == 0:
			destroyed = true
			
	var dist = player.global_position.distance_to(global_position)
	var dir_x = player.global_position.x - global_position.x
	var dir_y = player.global_position.y - global_position.y
	


	if exploted:
		be_exploted()
		
	if time_wait_charge != 0:
		
		time_wait_charge -= delta
	
	if time_charge > 1 and !exploted: 
		
		be_exploted()
		
	if dist<distancia_seguimiento and !charger and !exploted:
		
		movcont_x = dir_x
		movcont_y = dir_y
		
	if dist>distancia_seguimiento and !charger and !exploted:
		
		movcont_x = 0
		movcont_y = 0
		
	
	elif charger and time_wait_charge <= 0 and !exploted:
		
		movcont_x = dir_charger_x
		movcont_y = dir_charger_y
		time_charge += delta

	elif dist < distancia_ataque and !charger:
		
		animated_sprite.set_animation("wait")
		movcont_x = 0
		movcont_y = 0
		velocidad = 12000
		dir_charger_x = dir_x
		dir_charger_y = dir_y
		time_wait_charge = TIME_CHARGER
		charger = true
		
	if invincibility_timer > 0:
		invincibility_timer -= delta
		if invincibility_timer <= 0:
			show()
			get_node("DamageArea/CollisionShape2D2").set_deferred("disabled",false)
			
	if dir_x < dir_y and !exploted:
		
		animated_sprite.set_animation("side")
		
	elif dir_x <= dir_y and !exploted:
		animated_sprite.set_animation("stand")
		
	move_and_slide(Vector2(movcont_x, movcont_y).normalized() * velocidad * delta)
	
func be_damaged():
	invincibility_timer = INVINCIBILTY_TIME
	life -=1
	get_node("DamageArea/CollisionShape2D2").set_deferred("disabled",true)
	if life == 0:
		invincibility_timer = 0
		death()
		
func be_exploted():
	
	if animated_sprite.get_animation() != "explode":
		animated_sprite.set_animation("explode")
	movcont_x = 0
	movcont_y = 0
	exploted = true
	time_exploted += 0.03

	if time_exploted > 2:
		
		queue_free()

func death():
	
	queue_free()

func _on_Dao_area_entered(area:Area2D):
	if "Bullets" in area.get_groups():
		life -= 1

func _on_DamageArea_body_entered(body:KinematicBody2D):

	if body != null:
		if body.get_name().begins_with("Enemy") and invincibility_timer <= 0:
			be_damaged()

func _on_Area2D_body_entered(body):
		
	if body != null:
		if "Player" in body.get_groups():
			exploted = true
			
		if body.get_class().begins_with("TileMap"):

			if charger:
				exploted = true
