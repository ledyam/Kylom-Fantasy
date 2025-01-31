extends EnemyState

func enter() -> void:
	$"../../Timers/Await".start()  # Temporizador para controlar la espera antes de cambiar de estado.

func physics_process(_delta: float) -> void:
	if not enemy.on_area:
		# Movimiento hacia la posición actual en la patrulla
		enemy.velocity = (enemy.Patrullaje.current_position.global_position - enemy.global_position).normalized() * 15
		
		# Cambiar animación dependiendo de la dirección
		if enemy.velocity.x > 0:
			enemy.anim_enemy.play("Enemy_walk_right")
		else:
			enemy.anim_enemy.play("Enemy_walk_left")
		
		# Movimiento del enemigo
		enemy.move_and_slide()
		
		# Verificar si alcanzó la posición actual
		if enemy.global_position.distance_to(enemy.Patrullaje.current_position.global_position) < 5.0:
			enemy.Patrullaje._get_next_position()  # Obtiene la siguiente posición en la patrulla.
	else:
		state_machine.change_to("Walk")  # Cambia al estado de caminar si está en área.

func _on_await_timeout() -> void:
	# Cambiar al estado "Idle" o "Walk" según la condición
	if not enemy.on_area:
		state_machine.change_to("Idle")
	else:
		state_machine.change_to("Walk")
