extends EnemyState


func enter():
	print ("State >>>>WALK<<<<")
	
func physics_process(_delta: float) -> void:

	if (enemy.on_area and enemy.life > 0):
		enemy.velocity = Vector2.ZERO
		if enemy.player.position < enemy.position :
			enemy.anim_enemy.flip_h = true
			enemy.anim_enemy.play("Skeleton_walk")
			enemy.position -= (enemy.position - enemy.player.position  ) / 100
		else : 
			enemy.velocity = Vector2.ZERO
			enemy.anim_enemy.flip_h = false
			enemy.anim_enemy.play("Skeleton_walk")
			enemy.position -= (enemy.position - enemy.player.position  ) / 100
			
	
	else: 
		#Patrullaje En Estado Walk
		enemy.velocity = enemy.Patrullaje.direction * 20
		enemy.anim_enemy.play("Skeleton_walk")
		enemy.move_and_slide()

	
	

func _on_skeleton_take_damage() -> void:
	state_machine.change_to("EnemyTakeDamage")
	pass # Replace with function body.
