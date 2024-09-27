extends EnemyState



func enter() -> void:
	enemy.is_dead = true
	enemy.anim_enemy.play ("Enemy_dead")
	
	
func _dead() -> void:
	var temporal_item = enemy.Item.instantiate()
	temporal_item.global_position = enemy.global_position
	temporal_item.Stats = enemy.loot.duplicate()
	get_tree().current_scene.add_child(temporal_item)
	enemy.player.Give_Experiencia (randi_range(20 , 35))
	enemy.queue_free()
