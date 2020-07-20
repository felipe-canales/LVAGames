extends Node2D
var pausa = false
var options = false

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

	if Input.is_action_just_pressed("pausa") and !options and !get_children()[0].p:

		_unpaused()

func _physics_process(delta):
	

	if options:
		get_children()[0].p = true
		get_children()[0].hide()
		get_children()[1].p = false
		get_children()[1].show()
		
	else:
		get_children()[0].p = false
		get_children()[0].show()
		get_children()[1].p = true
		get_children()[1].hide()
		
	
