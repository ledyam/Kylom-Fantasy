extends EnemyState


func enter():
	print ("State >>>>WALK<<<<")
	
func physics_process(_delta: float) -> void:
	if (enemy.on_area and enemy.life > 0):
		
		if enemy.player.position < enemy.position :
			enemy.anim_enemy.flip_h = true
			enemy.anim_enemy.play("Enemy_walk")
			enemy.velocity = enemy.to_local(enemy.player.position).normalized()* 15
		else : 
			
			enemy.anim_enemy.flip_h = false
			enemy.anim_enemy.play("Enemy_walk")
			enemy.velocity = enemy.to_local(enemy.player.position).normalized() * 15
		enemy.move_and_slide()
	else: 
		enemy.Patrullaje._get_next_positions()
		state_machine.change_to("EnemyIdle")
		
		

	
	

func _on_skeleton_take_damage() -> void:
	state_machine.change_to("EnemyTakeDamage")
	pass # Replace with function body.
