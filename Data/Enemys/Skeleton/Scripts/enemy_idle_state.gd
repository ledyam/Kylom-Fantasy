extends EnemyState


func enter ():
	print ("Estado IDLE del SKELETON")
	enemy.anim_enemy.play("Skeleton_idle")
	pass
	
	

func physics_process(_delta: float) -> void:
	
	if enemy.on_area : 
		state_machine.change_to("EnemyWalk")
		
	if enemy.life <= 0 :
		state_machine.change_to("EnemyDead") 



	pass # Replace with function body.
