extends PlayerState

func enter():
	print (">>>>>ESTADO MOVE <<<<")
	player.is_moving = true

func physics_process(_delta):
	if player.is_moving:
		if Input.is_action_pressed("Atacar"):
			player.velocity = Vector2(0,0)
			state_machine.change_to("Attack")
		else:
			Mover()
	else :
		state_machine.change_to(player.abreviate.states._idle)

func Establecer_Animacciones ():
	if Input.is_action_pressed('ui_up'):
		set_current_direction(player.direction.up)
		player.anim_movement.play(player.abreviate.animations._walk_up)
	elif  Input.is_action_pressed("ui_down"):
		set_current_direction(player.direction.down)
		player.anim_movement.play(player.abreviate.animations._walk_down)

	elif  Input.is_action_pressed('ui_right'):
		set_current_direction(player.direction.right)
		player.anim_movement.play(player.abreviate.animations._walkr)

	elif  Input.is_action_pressed('ui_left'):
		set_current_direction(player.direction.left)
		player.anim_movement.play(player.abreviate.animations._walkl)

	else :
		state_machine.change_to(player.abreviate.states._idle)

func Mover ():
	Establecer_Animacciones ()
	var input_direction = Input.get_vector("ui_left","ui_right",'ui_up',"ui_down")
	player.mru_2d.direction_2d = input_direction
	player.mru_2d.move()
	if Input.is_action_pressed(" JumpIdle") or Input.is_action_pressed("Jump") :
		player.is_jumping = true
		state_machine.change_to("Jump")
