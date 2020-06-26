extends CanvasLayer

onready var pause = preload("res://nodos/UI/Pausa/Pausa.tscn")
var current_saturation
var objective_saturation
var current_brightness
var objective_brightness

# Called when the node enters the scene tree for the first time.
func _ready():
	set_life(5)
	current_saturation = 0.1
	objective_saturation = 0.0
	current_brightness = 0.0
	objective_brightness = 1.0
	get_node("Shader").get_material().set_shader_param("saturation", current_saturation)
	get_node("Shader").get_material().set_shader_param("brightness", current_brightness)
	
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("pausa"):
	
		var inPause = pause.instance()
		add_child(inPause)
		
func _physics_process(delta):
	# smoothly change saturation
	if current_saturation < objective_saturation:
		current_saturation += 0.005
		get_node("Shader").get_material().set_shader_param("saturation", current_saturation)
	elif current_saturation > objective_saturation:
		current_saturation -= 0.005
		get_node("Shader").get_material().set_shader_param("saturation", current_saturation)
		
	# fade in/out at start/end of level
	if current_brightness < objective_brightness - 0.01:
		current_brightness += 0.05
		get_node("Shader").get_material().set_shader_param("brightness", current_brightness)
		# fade in completed
		# add here new condition for level start
		if (abs(current_brightness - objective_brightness) < 0.01):
			# maybe do something and set timer before starting level
			get_tree().paused = false
	elif current_brightness > objective_brightness + 0.01:
		current_brightness -= 0.05
		get_node("Shader").get_material().set_shader_param("brightness", current_brightness)
		# fade out completed
		if (abs(current_brightness - objective_brightness) < 0.01):
			get_tree().paused = false
			get_tree().get_nodes_in_group("Chapters")[0].up_level()
			


func set_life(value):
	# set shader saturation
	objective_saturation = 1 - (value/5.0)
	# for heart
	for i in range(1, 6):
		var node = get_node("Heart" + str(i))
		# show filled heart
		if i <= value:
			node.frame = 0
		# show empty heart
		else:
			node.frame = 1 

func next_level_fade_out():
	get_tree().paused = true
	# maybe add timer before starting the fade out
	objective_brightness = 0.0

func show_game_over():
	get_node("GameOverMessage").show()
	if Input.is_action_pressed("reset"):
		
		get_tree().reload_current_scene()
