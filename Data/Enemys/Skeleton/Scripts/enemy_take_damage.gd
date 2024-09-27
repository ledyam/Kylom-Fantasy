extends EnemyState
@onready var cd_take_damage: Timer = $"../../CD_TakeDamage"

var bounce_strength = 300 
var knockback = Vector2.ZERO

func enter ():
	if !enemy.is_dead :
		print ("Recibiendo Daño Skeleton")
		cd_take_damage.start()
		knockback = (enemy.global_position - enemy.player.position).normalized() 
		enemy.velocity = knockback * 20
		
func physics_process(_delta: float) -> void:
	enemy.anim_enemy.play("Enemy_Take_Damage")
	enemy.move_and_slide()
	
