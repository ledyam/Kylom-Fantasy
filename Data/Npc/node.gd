extends EnemyState


func physics_process(delta: float) -> void:
	enemy.animation_player.play("Morir")
