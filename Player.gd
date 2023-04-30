extends Node2D
class_name player

var enemy_health: int = 5

var bonus_attack: int = 2 
var base_attack: int = 3

var can_attack: bool = true
	
func _ready():
	if can_attack == true:
		update_enemy_health()
	else: 
		print('Personagem impossibilitado de atacar')

func update_enemy_health() -> void:
	if base_attack + bonus_attack  >= enemy_health:
		print('Matou o inimigo.')
	elif base_attack + bonus_attack >= 3:
		print('Inimigo tomou 60% da vida em dano.')
	else:
		print('Inimigo sobreviveu ao ataque')
