extends EnemyState
@onready var cd_take_damage: Timer = $"../../CD_TakeDamage"
var bounce_strength = 300 
var knockback = Vector2.ZERO
func enter ():
	if enemy.is_dead != true:
		enemy.anim_enemy.play("Skeleton_Take_Damage")
		print ("Recibiendo Daño Skeleto")
		enemy.damage.play()
		cd_take_damage.start()
		knockback = (enemy.global_position - enemy.player.position).normalized() 
		enemy.velocity = knockback * 20
		
func physics_process(_delta: float) -> void:
	enemy.move_and_slide()
	
func _on_cd_take_damage_timeout() -> void:
	state_machine.change_to("EnemyIdle")
	pass # Replace with function body.
