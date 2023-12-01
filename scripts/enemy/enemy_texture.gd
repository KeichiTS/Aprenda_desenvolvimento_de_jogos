extends Sprite2D
class_name EnemyTexture

@export var attack_area_collision : CollisionShape2D
@export var animation : AnimationPlayer
@export var enemy: CharacterBody2D

func animate(_velocity) -> void: 
	pass 

func on_animation_finished(_anim_name: String) -> void:
	pass 
