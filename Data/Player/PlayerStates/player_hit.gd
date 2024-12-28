extends PlayerState

func enter():
	print ("Estado HIT")
	
	if player.stats.vida_actual > 0 :
		match player.current_direction:
			player.direction.none:
				player.anim_movement.play(player.animations._hit_down)
			player.direction.up :
				player.anim_movement.play(player.animations._hit_up)

			player.direction.down :
				player.anim_movement.play(player.animations._hit_down)

			player.direction.left :
				player.anim_movement.play(player.animations._hit_left)

			player.direction.right : 
				player.anim_movement.play(player.animations._hit_right)
		await get_tree().create_timer(0.43).timeout
		state_machine.change_to(player.states._idle)
	
	else :
		state_machine.change_to(player.states._dead)

	
	
	
