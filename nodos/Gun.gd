extends Area2D

const bullet = preload("res://nodos/Proyectil.tscn")

var speed = 200
var velocity = Vector2()
var distancia = 9999999999
var vector_distancia
var movimiento = 2
var rot = 0

# Variable for bullet
var bullet_fire = true
var bullet_cooldown = 0.25
var bullet_cooldown_counter = 0

# Variables for enemy
var focus_enemy
var target_enemy
var min_enemy
var enemies = []
var enemies_not_visible = []

var explosive_enemies = []


func _ready():
	
	explosive_enemies = get_tree().get_nodes_in_group("Explosive")
	
func check_destroy(target):
	
	if target != null:
		if target.destroyed:
			target.queue_free()
			enemies.erase(target)
			enemies_not_visible.erase(target)
			target_enemy = null
		
func ray_collider(target1, target2):
	
	var space_state = get_world_2d().get_direct_space_state()
	var result = space_state.intersect_ray(global_position, target1.global_position, [target2, get_parent()])
	return result.collider
	
func _process(delta):
	
	var min_dist = 999999999999
	for enemy in enemies:
				
		if !(enemy in enemies_not_visible) and !(enemy in explosive_enemies):
			vector_distancia = enemy.get_global_position() - get_global_position()
			distancia = vector_distancia.length_squared()
			
			if distancia < min_dist:
				min_dist = distancia
				min_enemy = enemy
				
				var collision = ray_collider(min_enemy, focus_enemy)
				if !(collision == min_enemy):
					enemies_not_visible.append(min_enemy)
				else:
					target_enemy = min_enemy

	for enemy in enemies_not_visible:
		
		check_destroy(enemy)
		if enemy == target_enemy:
			target_enemy = null
		
		var collision = ray_collider(enemy, focus_enemy)
		if (collision == enemy):
			enemies_not_visible.erase(enemy)

func _physics_process(delta):
	
	check_destroy(target_enemy)
	if target_enemy != null:
		rot = ((target_enemy.global_position - global_position).angle())
		if bullet_cooldown_counter >= bullet_cooldown:
				var bullet_inst = bullet.instance()
				bullet_inst.global_position = global_position
				bullet_inst.rotation = rot
				bullet_cooldown_counter = 0
				get_tree().get_root().add_child(bullet_inst)
				bullet_fire = true

		if bullet_fire:
			bullet_cooldown_counter += delta


func get_enemies():
	
	return enemies

func _on_Gun_body_entered(body:Node):
	
	if !enemies.has(body) && body.is_in_group("Enemy"):
		enemies.append(body)
