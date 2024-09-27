extends EnemyState


func enter ():
	print ("Estado IDLE del " + enemy.name)

	enemy.anim_enemy.play("Enemy_idle")
	pass
	
	
func physics_process(_delta: float) -> void:
	if enemy.life > 0: 
		if enemy.on_area :
			state_machine.change_to("Walk")
		else : 
			state_machine.change_to("Patrullaje")
	
