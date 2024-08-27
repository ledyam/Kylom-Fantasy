extends PlayerState
@onready var attack_sounds: AudioStreamPlayer2D = $"../../Attack_sounds"

func enter ():
	print (">>>>>ESTADO IDLE<<<<")
	
	#Direcciones de Player en IDLE
	match player.current_direction:
		player.direction.none:
			player.animated_sprite_2d.play(player.animations._idle)
		player.direction.up :
			player.animated_sprite_2d.play(player.animations._idle_up)

		player.direction.down :
			player.animated_sprite_2d.play(player.animations._idle)

		player.direction.left :
			player.animated_sprite_2d.play(player.animations._idle_turnL)

		player.direction.right : 
			player.animated_sprite_2d.play(player.animations._idle_turnR)

func physics_process(_delta: float):
	
	if (player.vida <= 0):
		state_machine.change_to(player.states._dead)
		
		
		
	else :
		#Cambios de Direccion de Movimeint y de Estado 
		if Dialogic.VAR.MOVERSE: 
			if Input.is_action_pressed('ui_up') :
				set_current_direction(player.direction.up)
				state_machine.change_to(player.states._walk)

			if Input.is_action_pressed('ui_down'):
				set_current_direction(player.direction.down)
				state_machine.change_to(player.states._walk)
				
			if Input.is_action_pressed('ui_right'):
				set_current_direction(player.direction.right)
				state_machine.change_to(player.states._walk)
				
			if Input.is_action_pressed('ui_left'):
				set_current_direction(player.direction.left)
				state_machine.change_to(player.states._walk)

			if Input.is_action_pressed("Atacar") and player.puede_atacar:
				attack_sounds.play()
				state_machine.change_to(player.states._atack)
