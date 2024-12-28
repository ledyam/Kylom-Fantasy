extends PlayerState
@onready var timer: Timer = $"../../Timers/Tiempo_de_muerte"
func enter ():
	print ("State >>>>DEADDDD<<<<")
	player.velocity = Vector2.ZERO
	player.anim_movement.play(player.animations._dead)
	
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
	
	
