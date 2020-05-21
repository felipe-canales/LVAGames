extends Node2D

func _ready():
 
	get_tree().paused = true
	set_process(true)
	
# Funcion para despausar el juego
func _unpaused():
	
		$"VBoxContainer".hide()
		$"VBoxContainer"._reset()
		queue_free()
		get_tree().paused = false
	
func _process(delta):
	
	if Input.is_action_just_pressed("pausa") and get_tree().paused:
		
		_unpaused()
