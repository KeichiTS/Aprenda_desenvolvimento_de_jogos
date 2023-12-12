extends Control
class_name BarContainer

@onready var tween : Tween

@onready var health_bar : TextureProgressBar = get_node('HealthBarBackground/HealthBar')
@onready var mana_bar : TextureProgressBar = get_node('ManaBarBackground/ManaBar')
@onready var exp_bar : TextureProgressBar = get_node('ExpBarBackground/ExpBar')

var current_exp : int
var current_mana : int
var current_health : int

func init_bar(health: int, mana : int, max_exp_value : int) -> void:
	exp_bar.max_value = max_exp_value
	health_bar.value = health
	mana_bar.max_value = mana
	
	health_bar.value = health
	mana_bar.value = mana
	exp_bar.value = 0 
	
	current_exp = 0
	current_mana = mana
	current_health = health
	
	
func increase_max_value(type : String, max_value : int, value : int) -> void:
	match type:
		"Health":
			health_bar.max_value = max_value
			health_bar.value = value
			current_health = value 

		"Mana":
			mana_bar.max_value = max_value
			mana_bar.value = value
			current_mana = value
