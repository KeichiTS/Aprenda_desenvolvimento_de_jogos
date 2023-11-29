extends Sprite2D
class_name EnemyTexture

@export var attack_area_collision_path : NodePath
@onready var attack_area_collision : CollisionShape2D = get_node(attack_area_collision_path)

@export var animation_path : NodePath
@onready var animation : AnimationPlayer = get_node(animation_path)

@export var enemy_path: NodePath
@onready var enemy : CharacterBody2D = get_node(enemy_path)

func animate(_velocity : Vector2) -> void: 
	pass 

func on_animation_finished(_anim_name: String) -> void:
	pass 
