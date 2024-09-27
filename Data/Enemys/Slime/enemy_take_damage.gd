extends "res://Data/Enemys/Skeleton/Scripts/enemy_take_damage.gd"

func _on_cd_take_damage_timeout() -> void:
	if enemy.life > 0 : 
		state_machine.change_to("Idle")
	else :
		state_machine.change_to("Dead")
	pass # Replace with function body.
