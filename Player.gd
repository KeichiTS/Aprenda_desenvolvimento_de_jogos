extends Node2D
class_name player

@export_range(0,100,5) var number: int = 0 
@export_multiline var dialog_text : String

func _ready():
	print(number)
