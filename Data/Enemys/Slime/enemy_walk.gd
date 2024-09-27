extends "res://Data/Enemys/Skeleton/Scripts/enemy_walk_state.gd"

func physics_process(_delta: float) -> void:
	if ( enemy.life > 0):
		if !enemy.can_jump: 
			if enemy.player.position < enemy.position :
				enemy.anim_enemy.play("Enemy_walk_left")
				enemy.velocity = enemy.to_local(enemy.player.position).normalized()* 15
			else :
				enemy.anim_enemy.play("Enemy_walk_right")
				enemy.velocity = enemy.to_local(enemy.player.position).normalized() * 15
		else : 
			if enemy.player.vida_actual > 0 : 
				if enemy.player.position < enemy.position :
					enemy.anim_enemy.play("Enemy_attack")
					enemy.velocity = enemy.to_local(enemy.player.position).normalized()* 15
				if enemy.player.position > enemy.position :
					enemy.anim_enemy.play("Enemy_attack")
					enemy.velocity = enemy.to_local(enemy.player.position).normalized() * 15
			else : enemy.can_jump = false 
		enemy.move_and_slide()
	else: 
		enemy.Patrullaje._get_next_positions()
		state_machine.change_to("Idle")
		




func _on_area_salto_body_entered(body: Node2D) -> void:
	if body as MainPlayer:
		enemy.can_jump = true
	pass # Replace with function body.


func _on_area_salto_body_exited(body: Node2D) -> void:
	if body as MainPlayer:
		enemy.can_jump = false 
	pass # Replace with function body.
	
func _on_take_damage() -> void:
	state_machine.change_to("TakeDamage")
	pass # Replace with function body.
