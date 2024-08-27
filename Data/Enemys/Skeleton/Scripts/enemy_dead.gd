extends EnemyState
@onready var dead: Timer = $"../../Dead"






func enter() -> void:
	enemy.dead = true
	enemy.anim_enemy.play ("Skeleton_dead")
	dead.start()
	pass
