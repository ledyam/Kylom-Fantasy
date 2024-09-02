extends PlayerState
@onready var finish_animation: Timer =  $"../../Timers/Finish_animation"





func enter():
	print ("ESTADO >>>>>ATACK<<<<<<")
	Animaciones()
	pass 

func Animaciones ():
	match player.current_direction:
		player.direction.up :
			player.animated_sprite_2d.play(player.animations._attack_up)
			finish_animation.start()
			
		player.direction.down:
			player.animated_sprite_2d.play(player.animations._attack)
			finish_animation.start()
			
		player.direction.none:
			player.animated_sprite_2d.play(player.animations._attack)
			finish_animation.start()
		player.direction.left :
			player.animated_sprite_2d.play(player.animations._attack_turnL)
			finish_animation.start()
		player.direction.right :
			player.animated_sprite_2d.play(player.animations._attack_turnR)
			finish_animation.start()
			
				
	
func _on_finish_animation_timeout() -> void:
	state_machine.change_to(player.states._idle)
	pass # Replace with function body.
