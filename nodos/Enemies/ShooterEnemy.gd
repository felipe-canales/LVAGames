extends KinematicBody2D

var shooted = false
var destroyed = false
var scale_down = false
var scale_up = false

const bullet = preload("res://nodos/Enemies/ShooterBullet.tscn")

var invincibility_timer = 0
export var INVINCIBILTY_TIME = 0.5

# Velocidad a la que se acerca el enemigo
var velocidad = 4000
# Distancia entre el enemigo y el player
var distancia = 200

var bullet_fire = true
var bullet_cooldown = 1
var bullet_cooldown_counter = 0

var rng = RandomNumberGenerator.new()

export var life = 5

var rot

# Por definir segun la agrupacion de nodos
onready var player = get_parent().get_parent().get_node("Player")

var movcont_x = 0
var movcont_y = 0

func _ready():
	pass 
	
func _process(delta):

	if player != null:
		rot = ((player.global_position - global_position).angle())
		if bullet_cooldown_counter >= bullet_cooldown:
				
				var bullet_inst = bullet.instance()
				bullet_inst.global_position = global_position

				bullet_inst.rotation = rot + (sin(rng.randf_range(0,2*PI)))
				bullet_cooldown_counter = 0
				get_tree().get_root().add_child(bullet_inst)
				life -= 1
				bullet_fire = true

		if bullet_fire:
			bullet_cooldown_counter += delta

func _physics_process(delta):
	
	if life == 0:
			destroyed = true
			
			
	var dist = player.global_position.distance_to(global_position)
	var dir_x = player.global_position.x - global_position.x
	var dir_y = player.global_position.y - global_position.y
	
	if dist<distancia:
		
		movcont_x = -dir_x
		movcont_y = -dir_y

	elif dist > distancia -  10 and dist < distancia +10:
		
		movcont_x = 0
		movcont_y = 0

	if invincibility_timer > 0:
		invincibility_timer -= delta
		if invincibility_timer <= 0:
			show()
			get_node("DamageArea/CollisionShape2D2").set_deferred("disabled",false)
		
	move_and_slide(Vector2(movcont_x, movcont_y).normalized() * velocidad * delta)
	



func _on_Area2D_area_entered(area):
	if "Bullets" in area.get_groups():
		life -= 1
