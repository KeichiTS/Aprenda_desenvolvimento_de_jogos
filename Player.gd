extends Node2D
class_name player

var lista_de_numeros: int = 150

func _ready():
	for numero in lista_de_numeros:
		print(numero + 1)
