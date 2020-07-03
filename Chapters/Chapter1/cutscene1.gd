extends Node2D

var queue = [
	# 	time	actor			action			argument
	[	 1.5, 	"Actor", 		"fade_in", 		2		],
	[	   4, 	"Actor", 		"move_left", 	300		],
	[	 5.5, 	"Actor", 		"stop",			null	],
	[	 5.6, 	"Actor", 		"move_up", 		100		],
	[	 5.9, 	"Actor", 		"move_right", 	200		],
	[	 6.2, 	"Actor", 		"stop",			null	],
	[	 6.5, 	"Actor", 		"fade_out", 	2		],
	[	 8.6, 	"Actor", 		"fade_in", 		0.5		],
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
		"fade_in":
			get_node(full_action[1]).fade_in(full_action[3])
		"fade_out":
			get_node(full_action[1]).fade_out(full_action[3])
		"finish":
			finish()


func _process(delta):
	time += delta
	#print(time)
	var first_action = queue[0]
	if first_action[0] < time:
		queue.pop_front()
		exec_action(first_action)
	
