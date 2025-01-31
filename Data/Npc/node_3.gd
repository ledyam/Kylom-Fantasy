extends EnemyState


func physics_process(delta: float) -> void:
	enemy.animation_player.play("Ataque2")

	if enemy.LIFE <= 0 : 
		state_machine.change_to("Morir")
