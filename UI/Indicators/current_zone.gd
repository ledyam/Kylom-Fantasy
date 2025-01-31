extends Panel



func _ready() -> void:
	$Label/AnimationPlayer.play("Show")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Show":
		$Label/AnimationPlayer.play("Hide")
	
	pass # Replace with function body.
