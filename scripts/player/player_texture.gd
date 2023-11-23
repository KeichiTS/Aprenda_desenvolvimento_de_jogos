extends Sprite2D
class_name PlayerTexture


@export var animation_path : NodePath
@export var player_path : NodePath
@onready var animation: AnimationPlayer = get_node(animation_path)
@onready var player: CharacterBody2D = get_node(player_path)

func animate(direction: Vector2) -> void:
	verify_position(direction)
	
	if direction.y != 0: 
		vertical_behavior(direction)
	elif player.landing == true:
		animation.play('landing')
		player.set_physics_process(false)
	else:
		horizontal_behavior(direction)

func verify_position(direction : Vector2) -> void:
	if direction.x > 0:
		flip_h = false
	elif direction.x < 0: 
		flip_h = true
		
func vertical_behavior(direction : Vector2) -> void:
	if direction.y > 0: 
		player.landing = true
		animation.play('fall')
	elif direction.y < 0:
		animation.play('jump')
	
func horizontal_behavior(direction : Vector2) -> void:
	if direction.x != 0:
		animation.play('run')
	else:
		animation.play('idle')



func on_animation_finished(anim_name: String):
	match  anim_name:
		'landing':
			player.landing = false 
			player.set_physics_process(true)
