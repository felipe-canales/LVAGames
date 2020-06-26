extends Node2D

var queue = [
	# 	time	actor			action			argument
	[	   3, 	"Actor", 		"move_left", 	300		],
	[	 4.5, 	"Actor", 		"stop",			null	],
	[	 4.6, 	"Actor", 		"move_up", 		100		],
	[	 4.9, 	"Actor", 		"move_right", 	200		],
	[	  10,	"",				"finish",		null	]
]

var time = 0

func _ready():
	pass
	#get_tree().paused = false


func finish():
	get_tree().get_nodes_in_group("Chapters")[0].up_level()
	
func exec_action(full_action):
	# match action
	match full_action[2]:
		"stop":
			get_node(full_action[1]).stop()
		"move_left":
			get_node(full_action[1]).move_x(-full_action[3])
		"move_right":
			get_node(full_action[1]).move_x(full_action[3])
		"move_up":
			get_node(full_action[1]).move_y(-full_action[3])
		"finish":
			finish()

func _process(delta):
	time += delta
	print(time)
	var first_action = queue[0]
	if first_action[0] < time:
		queue.pop_front()
		exec_action(first_action)
	
