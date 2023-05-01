extends CollisionShape2D

@export var player_ref : Node2D


func _ready():
	print(player_ref.name) 
