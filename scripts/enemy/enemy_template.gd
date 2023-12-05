extends CharacterBody2D
class_name EnemyTemplate

@export var texture : Sprite2D
@export var floor_ray : RayCast2D
@export var animation : AnimationPlayer

var can_die: bool = false
var can_hit: bool = false
var can_attack: bool = false 

var drop_bonus : int = 1 
var drop_list : Dictionary
var player_ref : Player = null 

@export var speed : int
@export var gravity_speed : int
@export var proximity_threshold : int 
@export var raycast_default_position : int 


func _physics_process(delta : float) -> void:
	gravity(delta)
	move_behavior()
	verify_position()
	texture.animate(velocity)
	move_and_slide()

func gravity(delta : float) -> void:
	velocity.y += delta * gravity_speed
	
func move_behavior() -> void:
	if player_ref != null:
		var distance : Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		if abs(distance.x) <= proximity_threshold:
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
			floor_ray.position.x = abs(raycast_default_position)
		elif direction < 0:
			texture.flip_h = false 
			floor_ray.position.x = raycast_default_position


func kill_enemy() -> void:
	animation.play('kill')
	spawn_item_probability()
	
func spawn_item_probability() -> void:
	var random_number: int = randi() % 21
	if random_number <= 6:
		drop_bonus = 1
	elif random_number >= 7 and random_number <= 13:
		drop_bonus = 2 
	else:
		drop_bonus = 3
	print('multiplicador de drop' + str(drop_bonus))
	for key in drop_list.keys():
		var rng : int = randi() % 100 + 1
		if rng <= drop_list[key][1] * drop_bonus:
			var item_texture : CompressedTexture2D = load(drop_list[key][0])
			var item_info : Array = [
				drop_list[key][0],
				drop_list[key][2],
				drop_list[key][3],
				drop_list[key][4],
				1
			]
