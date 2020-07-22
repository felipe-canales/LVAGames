extends Container

var volumenMusica = "musica"
var volumenEfectos = "efectos"
var p = true
var boton = 0

var botones = [volumenMusica, volumenEfectos]
var actual_boton = 0

var valorMusica = 0
var valorEfectos = 0

func _ready():
	self.hide()
	valorMusica = 11+int(get_tree().get_nodes_in_group("MusicaFondo")[0].volume_db/6.36)
	valorEfectos = 10+ int(get_tree().get_nodes_in_group("Efectos")[0].volume_db/6.36)
	$Musica.text = String(valorMusica)
	$Efectos.text = String(valorEfectos)

func _physics_process(delta):
	
	if p:
		pass
	else:
		options_interaction()

func options_interaction():
	
	if Input.is_action_just_pressed("pausa"):
		
		get_parent().options = false
		
	if Input.is_action_just_pressed("player_up"):
		
		actual_boton -= 1
		
	if Input.is_action_just_pressed("player_down"):
		
		actual_boton += 1
		
	actual_boton = actual_boton%len(botones)
	boton = botones[actual_boton]
	
	valorMusica = valorMusica%11
	valorEfectos = valorEfectos%11
	cambiar_valor_fondo(valorMusica)
	cambiar_valor_efectos(valorEfectos)
	
	match boton:
		
		volumenMusica:
			
			$Label.add_color_override("font_color", Color(float(198)/float(255),float(136)/float(255),float(174)/float(255)))
			$Label2.add_color_override("font_color", Color(1,1,1))
			
			if Input.is_action_just_pressed("player_right") and valorMusica !=10:
				valorMusica+=1
				$Musica.text = String(valorMusica)
			
			if Input.is_action_just_pressed("player_left") and valorMusica !=0:
				valorMusica-=1
				$Musica.text = String(valorMusica)
				
		volumenEfectos:
			
			$Label.add_color_override("font_color", Color(1,1,1))
			$Label2.add_color_override("font_color", Color(float(198)/float(255),float(136)/float(255),float(174)/float(255)))
			
			if Input.is_action_just_pressed("player_right") and valorEfectos != 10:
				valorEfectos+=1
				$Efectos.text = String(valorEfectos)
			
			if Input.is_action_just_pressed("player_left") and valorEfectos !=0:
				valorEfectos-=1
				$Efectos.text = String(valorEfectos)



func cambiar_valor_fondo(value):
	
	var musica_fondo = get_tree().get_nodes_in_group("MusicaFondo")
	get_tree().get_nodes_in_group("Chapters")[0].nivelMusica = -6.36*(11- value)
	
	for musica in musica_fondo:
		musica.volume_db = -6.36*(11- value)


func cambiar_valor_efectos(value):
	
	var efectos = get_tree().get_nodes_in_group("Efectos")
	get_tree().get_nodes_in_group("Chapters")[0].nivelEfectos = -6.36*(11- value)
	for efecto in efectos:
		efecto.volume_db = -6.36*(11-value)
