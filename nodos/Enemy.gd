extends KinematicBody2D

var destroyed = false
var scale_down = false
var scale_up = false
var destruction_started = true

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if destroyed:
		if destruction_started:
			destruction_started = false
		scale_down = true
