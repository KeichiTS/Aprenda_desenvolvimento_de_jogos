extends Node2D
class_name player

var lista_de_produtos: Array = [
	['Maçã', 10, 0.50],
	['Banana', 12, 0.25],
	['Laranja', 6, 0.35]
]

func _ready():
	for produto in lista_de_produtos:
		for informacao in produto:
			print(informacao)
