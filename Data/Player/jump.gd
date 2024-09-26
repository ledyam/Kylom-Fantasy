extends PlayerState

func enter():
	player.animated_player_movement.play("Player_Jump_front")
	


func _on_animation_player_movements_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Player_Jump_front":
		state_machine.change_to(player.states._idle)
	pass # Replace with function body.
