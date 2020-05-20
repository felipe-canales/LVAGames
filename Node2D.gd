extends Node2D


func _ready():
	$"VBoxContainer".hide()
	set_process(true)

func _process(delta):
	
	if Input.is_action_just_pressed("pausa") and get_tree().paused:
		get_tree().paused = false
		$"VBoxContainer".hide()
		$"VBoxContainer"._reset()


	elif Input.is_action_just_pressed("pausa") and get_tree().paused == false:
		get_tree().paused = true
		$"VBoxContainer".show()
		$"VBoxContainer"._reset()
		
