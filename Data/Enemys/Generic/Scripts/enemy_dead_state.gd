extends EnemyState



func enter() -> void:
	enemy.anim_enemy.play ("Enemy_dead")
	
	
func _dead() -> void:
	if enemy.can_loot != 0 : 
		var temporal_item = enemy.item.instantiate()
		CentralSignal.Instantiate.emit(temporal_item , enemy.global_position,enemy.loot)
		CentralSignal.Unlock_Bestiary.emit(enemy.NOMBRE)
	enemy.queue_free()
		
