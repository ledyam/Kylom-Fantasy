extends "res://Data/Enemys/Generic/Scripts/enemy_attack_state.gd"


func physics_process(_delta: float) -> void:
	if enemy.global_position.distance_to(enemy.player.position) <= enemy.MINIMUM_DISTANCE :
		enemy.anim_enemy.play("Enemy_attack")
		enemy.velocity = enemy.to_local(enemy.player.position ).normalized() * 15
		enemy.move_and_slide()
	else :
		enemy.can_jump = false
		state_machine.change_to("Walk")
	


func _on_goblin_take_damage() -> void:
	state_machine.change_to("TakeDamage")
	pass # Replace with function body.
