extends EnemyTexture
class_name WhaleTexture

func animate(velocity) -> void:
	if enemy.can_hit or enemy.can_die:
		action_behavior()
	move_behavior(velocity)
	
	
func action_behavior() -> void:
	if enemy.can_die:
		animation.play('dead')
		enemy.can_hit = false
		enemy.can_attack = false
		
	elif enemy.can_hit:
		animation.play('hit')
		enemy.can_attack = false 

func move_behavior(velocity) -> void:
	if velocity.x != 0:
		animation.play('run')
	else:
		animation.play('idle')

func on_animation_finished(anim_name: String) -> void:
	match anim_name: 
		'hit':
			enemy.can_hit = false 
			enemy.set_physics_process(true)
		'dead':
			enemy.kill_enemy()
