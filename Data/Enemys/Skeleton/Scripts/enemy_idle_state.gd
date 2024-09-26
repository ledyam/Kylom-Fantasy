extends EnemyState


func enter ():
	print ("Estado IDLE del SKELETON")
	enemy.anim_enemy.play("Enemy_idle")
	pass
	
	

func physics_process(_delta: float) -> void:
	
	if enemy.life > 0: 
		if enemy.on_area :
			state_machine.change_to("EnemyWalk")
		else : 
			
			state_machine.change_to("EnemyPatrullaje")
	else :
		state_machine.change_to("EnemyDead") 



	pass # Replace with function body.
