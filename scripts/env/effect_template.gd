extends AnimatedSprite2D
class_name EffectTemplate

func play_effect() -> void:
	print('isso_aqui, ele fez')
	play()


func on_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
