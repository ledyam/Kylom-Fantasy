extends EnemyState



func enter():
	print ("IDLE ENEMY")
	
	
func physics_process(delta: float) -> void:
	$"../../AnimatedSprite2D".play("default")
	
	if enemy.player_on:
		state_machine.change_to("Attack1")
	
