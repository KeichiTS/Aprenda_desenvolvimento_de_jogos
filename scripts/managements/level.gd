extends Node2D
class_name level

@onready var player: CharacterBody2D = get_node('Player')

func _ready():
	# no godot 3 player.get_node('Texture').connect('game_over', self , 'on_game_over')
	player.get_node('Texture').game_over.connect(on_game_over)
	
func on_game_over() -> void:
	get_tree().reload_current_scene()
