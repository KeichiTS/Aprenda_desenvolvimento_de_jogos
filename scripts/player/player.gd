extends CharacterBody2D
class_name Player

@onready var player_sprite: Sprite2D = get_node('Texture')

var jump_count : int = 0
var landing: bool = false 
var attacking: bool = false 
var defending: bool = false 
var crouching: bool = false 

var can_track_input: bool = true

@export var speed : int 
@export var jump_speed : int
@export var player_gravity : int

func _physics_process(delta: float):
	horizontal_movement_env()
	vertival_movement_env()
	actions_env()
	
	gravity(delta)
	move_and_slide()
	player_sprite.animate(velocity)

func horizontal_movement_env() -> void:
	var input_direction : float = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	velocity.x = input_direction * speed

func vertival_movement_env() -> void:
	if is_on_floor():
		jump_count = 0
		
	if Input.is_action_just_pressed('ui_select') and jump_count < 2:
		jump_count += 1 
		velocity.y = jump_speed

func actions_env() -> void:
	attack()
	crouch()
	defense()

func gravity(delta : float) -> void:
	velocity.y += delta * player_gravity
	if velocity.y >= player_gravity:
		velocity.y = player_gravity

func attack() -> void:
	var attack_condition: bool = not attacking and not crouching and not defending
	if Input.is_action_just_pressed('attack') and attack_condition and is_on_floor():
		attacking = true 
		player_sprite.normal_attack = true
	
func crouch() -> void:
	if Input.is_action_pressed('crouch') and is_on_floor() and not defending:
		crouching = true
		can_track_input = false
	elif not defending:
		crouching = false
		can_track_input = true 
		player_sprite.crouching_off = true 
	
func defense() -> void:
	if Input.is_action_pressed('defense') and is_on_floor() and not crouching:
		defending = true 
		can_track_input = false
	elif not crouching:
		defending = false
		can_track_input = true 
		player_sprite.shield_off = true 
