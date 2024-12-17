extends PlayerState


func physics_process(_delta: float) -> void:
	if player.is_moving : 
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		player.mru_2d.direction_2d = input_direction
		Animaciones()
		player.mru_2d.move()
	else : 
		Animaciones()


func Animaciones():
	match player.current_direction:
		player.direction.none:
			player.animated_player_movement.play("Player_jump_front")
		player.direction.up:
			player.animated_player_movement.play("Player_jump_back")
		player.direction.down:
			player.animated_player_movement.play("Player_jump_front")
		player.direction.left:
			player.animated_player_movement.play("Player_jump_left")
		player.direction.right:
			player.animated_player_movement.play("Player_jump_right")
			
		
	


func _on_animation_player_movements_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Player_jump_back" or anim_name == "Player_jump_front"   \
	or anim_name == "Player_jump_left" or anim_name == "Player_jump_right":
		if player.is_moving:
			state_machine.change_to(player.states._walk)
		else : 
			state_machine.change_to(player.states._idle)
