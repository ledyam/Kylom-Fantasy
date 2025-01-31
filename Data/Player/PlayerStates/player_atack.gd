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


func _on_animation_player_movements_animation_finished(anim_name: StringName) -> void:
	
	var jump_animations =  [
 'Player_attack_down',
 'Player_attack_up',
 'Player_attack_left',
'Player_attack_right']
	
	if anim_name in jump_animations:
		state_machine.change_to(player.abreviate.states._walk)
