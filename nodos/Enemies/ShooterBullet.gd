extends Area2D

var destroyed = false
var speed = 1800
var velocity = Vector2.ZERO

func _ready():
	
	velocity = speed * transform.x
	
func _physics_process(delta):
	
	position += velocity * delta




func _on_Node2D_body_entered(body):
	match body.get_class():
		"TileMap":
			queue_free()
	
	if "Player" in body.get_groups():
		
		body.be_damaged()
		
		queue_free()
