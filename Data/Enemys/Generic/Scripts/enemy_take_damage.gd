extends EnemyState

var bounce_strength = 300 
var knockback = Vector2.ZERO

func enter ():
	if enemy.is_alive :
		print ("Enemy Recive Damage")
		knockback = (enemy.global_position - enemy.player.position).normalized() 
		enemy.velocity = knockback * 10
		
func physics_process(_delta: float) -> void:
	if enemy.is_alive:
		enemy.anim_enemy.play("Enemy_take_damage")
		enemy.move_and_slide()
		

func Change_state ():
	
		if enemy.life > 0 : 
			state_machine.change_to("Idle")
			
		else :
			enemy.is_alive = false
			state_machine.change_to("Dead")
