extends RigidBody2D
class_name PhysicItem

@onready var sprite : Sprite2D = get_node('Texture')

var player_ref : CharacterBody2D = null

var item_name : String
var item_info_list : Array
var item_texture : CompressedTexture2D

func _ready() -> void:
	randomize()
	apply_random_impulse()

func apply_random_impulse() -> void:
	apply_impulse(
		Vector2.ZERO,
		Vector2(
			randf_range(-30,30),
			-90
		)
	)
	
func update_item_info(key : String, texture : CompressedTexture2D, item_info : Array) -> void:
	await self._ready()
	
	item_name = key
	item_texture = texture
	item_info_list = item_info
	
	sprite.texture = texture


func on_screen_exited():
	queue_free()


func on_body_entered(body: Player):
	player_ref = body 


func on_body_exited(_body : Player):
	player_ref = null
	
func _process(delta: float) -> void:
	if player_ref != null and Input.is_action_just_pressed('interact'):
		#emitir sinal para enviar item para o inventario 
		queue_free()
