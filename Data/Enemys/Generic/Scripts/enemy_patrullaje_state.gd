extends EnemyState



func physics_process(_delta: float) -> void:
	if enemy.on_area != true:
		enemy.velocity = enemy.Patrullaje.direction * 15
		if enemy.position < enemy.Patrullaje.current_positions.position :
			enemy.anim_enemy.play("Enemy_walk_right")
		else: 
			enemy.anim_enemy.play("Enemy_walk_left")
		enemy.move_and_slide()

	else:
		state_machine.change_to("Walk")
