extends EnemyState
@onready var dead: Timer = $"../../Dead"


func enter() -> void:
	enemy.is_dead = true
	enemy.anim_enemy.play ("Skeleton_dead")
	enemy.player.Give_Exp (randi_range(20 , 35))
	dead.start()
	pass
