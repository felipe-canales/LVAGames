extends KinematicBody2D

var shooted = false
var destroyed = false
var scale_down = false
var scale_up = false

var invincibility_timer = 0
export var INVINCIBILTY_TIME = 0.5

var follow = false
var flip = false

# Velocidad a la que se acerca el enemigo
var velocidad = 4000
# Distancia entre el enemigo y el player
var distancia = 200

export var life = 1

onready var animated_sprite:AnimatedSprite = $AnimatedSprite

# Por definir segun la agrupacion de nodos
onready var player = get_parent().get_parent().get_node("Player")
onready var img_vida = get_node("Vida")

var movcont_x = 0
var movcont_y = 0

func _ready():
	animated_sprite.set_animation("stand")
	img_vida.set_values(life)

func _physics_process(delta):
	
	if life == 0:
			destroyed = true
			
	if follow:
			
		var dist = player.global_position.distance_to(global_position)
		var dir_x = player.global_position.x - global_position.x
		var dir_y = player.global_position.y - global_position.y
		
		if dir_x > abs(dir_y):
			flip = false
			update_animation("side")
			#animated_sprite.set_animation("side")
		
		elif -dir_x > abs(dir_y):
			flip = true
			update_animation("side")
			#animated_sprite.set_animation("side")
		
		else:
			update_animation("stand")
			#animated_sprite.set_animation("stand")
		
	
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
	img_vida.danio()
	get_node("DamageArea/CollisionShape2D2").set_deferred("disabled",true)
	if life == 0:
		invincibility_timer = 0
		death()
		
func death():
	
	queue_free()

func _on_Dao_area_entered(area:Area2D):
	if "Bullets" in area.get_groups():
		life -= 1
		img_vida.danio()

func _on_DamageArea_body_entered(body:KinematicBody2D):

	if body != null:
		if "Enemy" in body.get_groups() and invincibility_timer <= 0:
			be_damaged()
		
	
			
func _on_Area2D_body_entered(body):
	if body != null:
		if "Player" in body.get_groups():
			follow = true # Replace with function body.
	
func update_animation(animation):
	if animated_sprite.animation != animation:
		animated_sprite.animation = animation
	animated_sprite.set_flip_h(flip)

func _on_DamageArea_area_entered(area):
	if "BulletsEnemy" in area.get_groups():
			be_damaged()
