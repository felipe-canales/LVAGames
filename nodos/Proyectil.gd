extends Area2D

var destroyed = false
var speed = 180
var velocity = Vector2.ZERO

func _ready():
	
	velocity = speed * transform.x
	
func _physics_process(delta):
	
	position += velocity * delta

func _on_Proyectil_body_entered(body):
	
	match body.get_class():
		"TileMap":
			queue_free()
	
	if body.get_name().begins_with("Enemy"):
		if !body.destroyed:
			destroyed = true
			body.shooted = true
