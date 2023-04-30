extends Node2D
class_name player



var bonus_attack: int = 2 
var base_attack: int = 0

	
func _ready():
	match base_attack + bonus_attack:
		0:
			print('inimigo tomou 0 de dano')
		1:
			print('inimigo tomou 1 de dano')
		2:
			print('inimigo tomou 2 de dano')
		3:
			print('inimigo tomou 3 de dano')
		4:
			print('inimigo tomou 4 de dano')
		_:
			print('dano desconhecido')
