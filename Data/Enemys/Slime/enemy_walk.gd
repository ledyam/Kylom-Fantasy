extends "res://Data/Enemys/Generic/Scripts/enemy_walk_state.gd"

func physics_process(_delta: float) -> void:
	if  enemy.is_alive:
		if enemy.global_position.distance_to(enemy.player.position) > enemy.MINIMUM_DISTANCE: 
			if enemy.player.position < enemy.position :
				enemy.anim_enemy.play("Enemy_walk_left")
				enemy.velocity = enemy.to_local(enemy.player.position).normalized()* 15
			else :
				enemy.anim_enemy.play("Enemy_walk_right")
				enemy.velocity = enemy.to_local(enemy.player.position).normalized() * 15
			enemy.move_and_slide()
		else : 
			state_machine.change_to("Attack")
		
	else: 
		enemy.Patrullaje._get_next_positions()
		state_machine.change_to("Idle")
		




	
func _on_take_damage() -> void:
	state_machine.change_to("TakeDamage")
	pass # Replace with function body.
