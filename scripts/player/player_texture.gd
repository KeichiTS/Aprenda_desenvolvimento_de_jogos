extends Sprite2D
class_name PlayerTexture

var suffix: String = '_right'
var normal_attack: bool = false 
var shield_off: bool = false
var crouching_off: bool = false 

@export var animation_path : NodePath
@export var player_path : NodePath
@onready var animation: AnimationPlayer = get_node(animation_path)
@onready var player: CharacterBody2D = get_node(player_path)

func animate(direction: Vector2) -> void:
	verify_position(direction)
	
	if player.attacking or player.defending or player.crouching or player.next_to_wall():
		action_behavior()
	
	elif direction.y != 0: 
		vertical_behavior(direction)
	elif player.landing == true:
		animation.play('landing')
		player.set_physics_process(false)
	else:
		horizontal_behavior(direction)

func verify_position(direction : Vector2) -> void:
	if direction.x > 0:
		flip_h = false
		suffix = '_right'
		player.direction = -1
		position = Vector2.ZERO
		player.wall_ray.target_position = Vector2(10.5,0)
	elif direction.x < 0: 
		suffix = '_left'
		player.direction = 1
		flip_h = true
		position = Vector2( -2, 0 )
		player.wall_ray.target_position = Vector2(-12.5,0)
func action_behavior() -> void:
	if player.next_to_wall():
		animation.play('wall_slide')
	elif player.attacking and normal_attack:
		animation.play('attack' + suffix)
	elif player.defending and shield_off:
		animation.play('shield')
		shield_off = false 
	elif player.crouching and crouching_off:
		animation.play('crouch')
		crouching_off = false 

		
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
		'attack_left':
			normal_attack = false 
			player.attacking = false
		'attack_right':
			normal_attack = false 
			player.attacking = false 
