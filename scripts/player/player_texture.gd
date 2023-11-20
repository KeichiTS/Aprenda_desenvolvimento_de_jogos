extends Sprite2D
class_name PlayerTexture


@export var animation_path : NodePath
@onready var animation: AnimationPlayer = get_node(animation_path)

func animate(direction: Vector2) -> void:
	verify_position(direction)
	horizontal_behavior(direction)

func verify_position(direction : Vector2) -> void:
	if direction.x > 0:
		flip_h = false
	elif direction.x < 0: 
		flip_h = true

func horizontal_behavior(direction : Vector2) -> void:
	if direction.x != 0:
		animation.play('run')
	else:
		animation.play('idle')
