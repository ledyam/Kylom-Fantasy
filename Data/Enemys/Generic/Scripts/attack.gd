extends EnemyState

func physics_process(delta: float) -> void:
	if enemy.global_position.distance_to(enemy.player.position) <= enemy.MINIMUM_DISTANCE :
		enemy.anim_enemy.play("Enemy_attack")
	else :
		state_machine.change_to("Walk")
	


func _on_goblin_take_damage() -> void:
	state_machine.change_to("TakeDamage")
	pass # Replace with function body.
