extends PlayerState


func enter():
	print ("ESTADO >>>>>ATACK<<<<<<")
	Animaciones()
	pass 

func Animaciones ():
	
	match player.current_direction:
		player.direction.up :
			player.anim_movement.play(player.abreviate.animations._attack_up)
			
		player.direction.down:
			player.anim_movement.play(player.abreviate.animations._attack)
			
		player.direction.none:
			player.anim_movement.play(player.abreviate.animations._attack)
			
		player.direction.left :
			player.anim_movement.play(player.abreviate.animations._attack_turnL)
			
		player.direction.right :
			player.anim_movement.play(player.abreviate.animations._attack_turnR)
			
	$"../../Timers/Finish_animation".start()

				
	
func _on_finish_animation_timeout() -> void:
	state_machine.change_to(player.abreviate.states._idle)
	pass # Replace with function body.
