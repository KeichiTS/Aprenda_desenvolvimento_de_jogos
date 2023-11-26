extends CharacterBody2D
class_name EnemyTemplate

@export var texture_path : NodePath
@onready var texture : Sprite2D = get_node(texture_path)

@export var floor_ray_path : NodePath
@onready var floor_ray : RayCast2D = get_node(floor_ray_path)

@export var animation_path : NodePath
@onready var animation : AnimationPlayer = get_node(animation_path)

var can_die: bool = false
var can_hit: bool = false
var can_attack: bool = false 

var player_ref : Player = null 

@export var speed : int
@export var gravity_speed : int
@export var proximity_threshhold : int 
@export var raycast_default_position : int 

func _physics_process(delta : float) -> void:
	gravity(delta)
	move_behavior()
	verify_position()
	#texture.animate(velocity)
	move_and_slide()

func gravity(delta : float) -> void:
	velocity.y += delta * gravity_speed
	
func move_behavior() -> void:
	if player_ref != null:
		var distance : Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		if abs(distance.x) <= proximity_threshhold:
			velocity.x = 0 
			can_attack = true 
		elif floor_collision() and not can_attack:
			velocity.x = direction.x * speed
		
		else:
			velocity.x = 0 
		return
		
	velocity.x = 0 
	
func floor_collision() -> bool:
	if floor_ray.is_colliding():
		return true
		
	return false


func verify_position() -> void:
	if player_ref != null:
		var direction : float = sign(player_ref.global_position.x - global_position.x)
		
		if direction > 0:
			texture.flip_h = true
			floor_ray.x = abs(raycast_default_position)
		elif direction < 0:
			texture.flip_h = false 
			floor_ray.position.x = raycast_default_position
