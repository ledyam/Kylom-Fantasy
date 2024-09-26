extends PlayerState
@onready var attack_sounds: AudioStreamPlayer2D = $"../../Sounds/Attack_sounds"

func enter ():
	print (">>>>>ESTADO IDLE<<<<")
	
	#Direcciones de Player en IDLE
	match player.current_direction:
		player.direction.none:
			player.animated_player_movement.play(player.animations._idle)
		player.direction.up :
			player.animated_player_movement.play(player.animations._idle_up)

		player.direction.down :
			player.animated_player_movement.play(player.animations._idle)

		player.direction.left :
			player.animated_player_movement.play(player.animations._idle_turnL)

		player.direction.right : 
			player.animated_player_movement.play(player.animations._idle_turnR)

func physics_process(_delta: float):
	
	if (player.vida_actual <= 0):
		player.can_attack = false
		player.recibir_damage = false 
		state_machine.change_to(player.states._dead)
	else :
		#Cambios de Direccion, Movimiento y Estado 
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

			if Input.is_action_pressed("Atacar") and player.can_attack:
				attack_sounds.play()
				state_machine.change_to(player.states._atack)
				
			if Input.is_action_pressed(' Jump'):
				state_machine.change_to("Jump")

func _on_marcus_hit_damage() -> void:
	state_machine.change_to("Damage")
	pass # Replace with function body.
