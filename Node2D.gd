extends Node2D
var pausa = false

func _ready():
 
	get_tree().paused = true
	set_process(true)
	
func pausa():
	
	if pausa:
		pausa = false
	else:
		pausa = true
	
# Funcion para despausar el juego
func _unpaused():
	
		$"VBoxContainer".hide()
		$"VBoxContainer"._reset()
		queue_free()
		get_tree().paused = false
		get_tree().get_nodes_in_group("UIprincipal")[0]._pausa()
		
func _process(delta):

	if Input.is_action_just_pressed("pausa"):

		_unpaused()

