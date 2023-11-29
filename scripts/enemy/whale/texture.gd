extends EnemyTexture
class_name WhaleTexture

func animate(velocity) -> void:
	move_behavior(velocity)
	
func move_behavior(velocity) -> void:
	if velocity.x != 0:
		animation.play('run')
	else:
		animation.play('idle')
