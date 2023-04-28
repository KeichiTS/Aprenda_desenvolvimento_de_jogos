extends Node2D
class_name player

var space = '  '
var hello = 'Hello!'
var player_name = 'Davi'

func _physics_process(delta):
	pass
	
func _ready():
	print(hello + " " + player_name)
