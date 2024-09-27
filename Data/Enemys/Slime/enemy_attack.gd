extends EnemyState


func physics_process(delta: float):
	
	enemy.velocity = enemy.to_local(enemy.player.position).normalized()* 100
	enemy.anim_enemy.play("Enemy_attack")
	

	
