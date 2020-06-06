extends Node2D

onready var nav : Navigation2D = $Navigation2D

onready var gun = $Player/Gun

func _process(delta):
	
	var enemies = gun.get_enemies()

	for enemy in enemies:
		
		var new_path : = nav.get_simple_path(enemy.global_position, gun.global_position)
		print(new_path)

		enemy.path = new_path
		
	
