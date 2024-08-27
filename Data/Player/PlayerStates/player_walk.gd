extends PlayerState

func enter():
	print (">>>>>ESTADO MOVE <<<<")
	

func physics_process(_delta):
	if Dialogic.VAR.MOVERSE:
		Mover()
	else :
		state_machine.change_to(player.states._idle)

func Establecer_Animacciones ():
	if Input.is_action_pressed('ui_up'):
		player.animated_sprite_2d.play(player.animations._walk_up)
	elif  Input.is_action_pressed("ui_down"):
		player.animated_sprite_2d.play(player.animations._walk_down)

	elif  Input.is_action_pressed('ui_right'):
		player.animated_sprite_2d.play(player.animations._walkr)

	elif  Input.is_action_pressed('ui_left'):
				player.animated_sprite_2d.play(player.animations._walkl)

	else :
		state_machine.change_to(player.states._idle)

func Mover ():
	Establecer_Animacciones ()
	var input_direction = Input.get_vector("ui_left","ui_right",'ui_up',"ui_down")
	player.mru_2d.direction_2d = input_direction
	player.mru_2d.move()
	
