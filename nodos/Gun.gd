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


func _ready():
	pass # Replace with function body.

func _physics_process(delta):

	if len(enemigos) != 0:
		
		focus_enemy = enemigos[0]
		for enemigo in enemigos:
			
			vector_distancia = enemigo.get_global_position() - get_global_position()
			distancia = vector_distancia.length_squared()
		
			vector_distancia = focus_enemy.get_global_position() - get_global_position()
			distancia1 = vector_distancia.length_squared()
			
			if distancia <= distancia1:
				focus_enemy = enemigo
		
		if focus_enemy != null:
			if focus_enemy.destroyed:
				focus_enemy.queue_free()
				enemigos.erase(focus_enemy)

			rotation = ((focus_enemy.position - global_position).angle()) + PI/2

	var bullet_inst = bullet.instance()
	bullet_inst.global_position = Vector2(0,0)
	bullet_inst.rotation = rotation

	if bullet_fire:
		bullet_cooldown_counter += delta

	if bullet_cooldown_counter >= bullet_cooldown:
		bullet_cooldown_counter = 0
		$"../Bullets".add_child(bullet_inst)
		bullet_fire = true

func _on_Gun_body_entered(body:Node):
	
	if !enemigos.has(body) && body.is_in_group("Enemy"):
		enemigos.append(body)
	
	
	
