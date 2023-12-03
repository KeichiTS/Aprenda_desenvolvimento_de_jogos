extends Area2D
class_name CollisionArea

@onready var timer: Timer = get_node('Timer')

@export var health : int
@export var invulnerability_timer : float
@export var enemy : CharacterBody2D

func on_collision_area_entered(area):
	if area.get_parent().name == 'Player' and area.name == 'AttackArea':
#	if area.get_parent() is Player:
		var player_stats : Node = area.get_parent().get_node('Stats')
		var player_attack : int = player_stats.base_attack + player_stats.bonus_attack
		update_health(player_attack)
		
func update_health(damage : int) -> void:
	health -= damage
	if health <= 0:
		enemy.can_die = true 
		return
	
	enemy.can_hit = true 

