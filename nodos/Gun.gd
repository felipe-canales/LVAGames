extends Area2D

const bullet = preload("res://nodos/Proyectil.tscn")

var speed = 200
var enemigos = []
var velocity = Vector2()
var focus_enemy

var distancia = 9999999999
var vector_distancia
var movimiento = 2

var bullet_fire = true
var bullet_cooldown = 0.25

var bullet_cooldown_counter = 0
var distancia1 = 999999999999

var min_enemy
var enemigos_novisibles = []


func _ready():
	pass # Replace with function body.

func _physics_process(delta):

	var min_dist = 999999999999
	var target_enemy
	
	for enemigo in enemigos:
		if !(enemigo in enemigos_novisibles):
			vector_distancia = enemigo.get_global_position() - get_global_position()
			distancia = vector_distancia.length_squared()
			if distancia < min_dist:
				min_dist = distancia
				min_enemy = enemigo
				var space_state = get_world_2d().get_direct_space_state()
				var result = space_state.intersect_ray(global_position, min_enemy.global_position, [focus_enemy, get_parent()])
				var collision:Node = result.collider
				if !(collision == min_enemy):
					enemigos_novisibles.append(min_enemy)
				else:
					target_enemy = min_enemy

		if target_enemy:
			if target_enemy.destroyed:
				target_enemy.queue_free()
				enemigos.erase(target_enemy)
		
			rotation = ((target_enemy.global_position - global_position).angle())

			if bullet_cooldown_counter >= bullet_cooldown:
				var bullet_inst = bullet.instance()
				bullet_inst.global_position = global_position
				bullet_inst.rotation = rotation
				bullet_cooldown_counter = 0
				get_tree().get_root().add_child(bullet_inst)
				bullet_fire = true

	if bullet_fire:
		bullet_cooldown_counter += delta
		
	for enemigo in enemigos_novisibles:
		
		var space_state = get_world_2d().get_direct_space_state()
		var result = space_state.intersect_ray(global_position, enemigo.global_position, [focus_enemy, get_parent()])
		var collision:Node = result.collider
		if (collision == enemigo):
			enemigos_novisibles.erase(enemigo)

func _on_Gun_body_entered(body:Node):

	
	if !enemigos.has(body) && body.is_in_group("Enemy"):
		enemigos.append(body)
	
	
	
