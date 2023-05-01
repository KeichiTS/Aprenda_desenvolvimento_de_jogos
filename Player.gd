extends Node2D
class_name player

@onready var sprite: CollisionShape2D = get_node('CollisionShape2D')

func _ready():
	#print(sprite)
	pass


func _on_visibility_changed():
	pass # Replace with function body.
