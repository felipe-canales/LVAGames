extends Node2D

var menu
var bullets

func _physics_process(delta):
	
	menu = $"UI/pausa/VBoxContainer"
	bullets = $"Player/Bullets"
	menu.set_bull(bullets)
	
	
