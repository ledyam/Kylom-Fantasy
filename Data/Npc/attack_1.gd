extends EnemyState


func physics_process(delta: float) -> void:
	enemy.animation_player.play("Ataque1")

	if enemy.LIFE <= 50 : 
		state_machine.change_to("Attack2")




	pass # Replace with function body.
