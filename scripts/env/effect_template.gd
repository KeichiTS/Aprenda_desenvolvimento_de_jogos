extends AnimatedSprite2D
class_name EffectTemplate

func play_effect() -> void:
	play()

func on_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
