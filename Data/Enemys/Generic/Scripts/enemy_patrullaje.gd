extends EnemyState

@onready var receso_patrullaje: Timer = $Receso_Patrullaje

func physics_process(_delta: float) -> void:
	if enemy.on_area != true:
		enemy.velocity = enemy.Patrullaje.direction * 15
		if enemy.position < enemy.Patrullaje.current_positions.position :
			enemy.anim_enemy.play("Enemy_walk_right")
		else: 
			enemy.anim_enemy.play("Enemy_walk_left")
		enemy.move_and_slide()
		if receso_patrullaje.is_stopped():
			receso_patrullaje.start()
	else:
		state_machine.change_to("Walk")


func _on_receso_patrullaje_timeout() -> void:
	state_machine.change_to("Idle")
	pass # Replace with function body.
