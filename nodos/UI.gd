extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var pause = preload("res://nodos/UI/Pausa/Pausa.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("pausa"):
	
		var inPause = pause.instance()
		add_child(inPause)


func set_life(value):
	# for heart
	for i in range(1, 6):
		var node = get_node("Heart" + str(i))
		# show filled heart
		if i <= value:
			node.frame = 0
		# show empty heart
		else:
			node.frame = 1 

func show_game_over():
	get_node("GameOverMessage").show()
	if Input.is_action_pressed("reset"):
		
		get_tree().reload_current_scene()
