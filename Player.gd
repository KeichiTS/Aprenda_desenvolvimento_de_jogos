extends Node2D
class_name player

var i: int = 0

func _ready():
	while i < 1000:
		print(i)
		i += 1 
	print('While finalizou')
