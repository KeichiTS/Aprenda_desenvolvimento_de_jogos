extends Node2D
class_name player

var enemy_health: int = 5

var bonus_attack: int = 2 
var base_attack: int = 3

var can_attack: bool = false
	
func _ready():
	print(update_enemy_health())


func update_enemy_health() -> String:
	if can_attack == true:
		if base_attack + bonus_attack  >= enemy_health:
			return 'Matou o inimigo.'
		elif base_attack + bonus_attack >= 3:
			return 'Inimigo tomou 60% da vida em dano.'
		else:
			return 'Inimigo sobreviveu ao ataque'
	else: 
		return 'Personagem impossibilitado de atacar'
