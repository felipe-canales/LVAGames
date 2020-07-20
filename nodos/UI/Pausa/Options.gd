extends Container

var p = true


func _ready():
	self.hide()
	

func _physics_process(delta):
	
	if p:
		pass
	else:
		options_interaction()

func options_interaction():
	
	if Input.is_action_just_pressed("pausa"):
		
		get_parent().options = false




func _on_HSlider_value_changed(value):
	
	var musica_fondo = get_tree().get_nodes_in_group("MusicaFondo")
	for musica in musica_fondo:
		musica.volume_db = value


func _on_HSlider2_value_changed(value):
	
	var efectos = get_tree().get_nodes_in_group("Efectos")
	for efecto in efectos:
		efecto.volume_db = value
