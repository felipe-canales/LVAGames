extends KinematicBody2D

export var life = 5
export var INVINCIBILTY_TIME = 0.5
export var HEAL_TIME = 0.5
var vel = Vector2(0,0)
var invincibility_timer = 0
var heal_timer = 0
const TARGET_AXIS = 100
const TARGET_DIAG = TARGET_AXIS / 1.41
const ACCEL = 1.5



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if invincibility_timer > 0:
		if is_visible():
			hide()
		else:
			show()
	if(len(get_tree().get_nodes_in_group("Enemy")) == 0):
		
		get_parent().get_node("UI").show_game_over()


func _physics_process(delta):
	

	var target_x = 0
	var target_y = 0
	# Set direction
	if Input.is_action_pressed("player_right"):
		target_x += 1
	if Input.is_action_pressed("player_left"):
		target_x -= 1
	if Input.is_action_pressed("player_down"):
		target_y += 1
	if Input.is_action_pressed("player_up"):
		target_y -= 1
	# Higher speed if not moving diagonally
	if (target_x and target_y):
		target_x *= TARGET_DIAG
		target_y *= TARGET_DIAG
	else:
		target_x *= TARGET_AXIS
		target_y *= TARGET_AXIS
	# Moving
	vel.x = lerp(vel.x, target_x, ACCEL)
	vel.y = lerp(vel.y, target_y, ACCEL)
	move_and_slide(vel)
	# After damage invincibility
	if invincibility_timer > 0:
		invincibility_timer -= delta
		if invincibility_timer <= 0:
			show()
			get_node("DamageArea/CollisionShape2D").set_deferred("disabled",false)
			
	if heal_timer == HEAL_TIME:
		
		life+=1
		get_parent().get_node("UI").set_life(life)
		heal_timer -= delta
		
	elif heal_timer >= 0:
		
		heal_timer-=delta

func be_damaged():
	invincibility_timer = INVINCIBILTY_TIME
	life -=1

	get_parent().get_node("UI").set_life(life)
	get_node("DamageArea/CollisionShape2D").set_deferred("disabled",true)
	if life == 0:
		invincibility_timer = 0
		death()
		
func be_heal():
	
	if heal_timer < 0:
		
		heal_timer = HEAL_TIME
		
	
func death():
	#hide()
	#get_node("CollisionShape2D").set_deferred("disabled", true)
	#get_tree().paused = true
	
	get_tree().reload_current_scene()
	get_tree().get_nodes_in_group("Chapters")[0].up_level()

func _on_DamageArea_body_entered(body):
	if "Enemy" in body.get_groups() and invincibility_timer <= 0:
		be_damaged()

